import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pothipatra/models/categories_model.dart';
import 'package:pothipatra/models/city_model.dart';
import 'package:pothipatra/models/news_model.dart';
import 'package:pothipatra/models/place_model.dart';
import 'package:pothipatra/models/responce_model.dart';
import 'package:pothipatra/models/state_model.dart';
import 'package:pothipatra/repositories/category_repository.dart';
import 'package:pothipatra/services/auth_service.dart';

import '../../../common/auth_popup.dart';
import '../../../models/bookmark_item_model.dart';

class HomeController extends GetxController {
  final index = 0.obs;
  final stateId = "".obs;
  final category = <BookMarkItemModel>[].obs;
  final hideIcon = true.obs;
  CategoryRepository? categoryRepository;
  final categories = <Category>[].obs;
  final filterCategories = <Category>[].obs;
  final news = <News>[].obs;
  final places = <PlaceModel>[].obs;
  final state = <States>[].obs;
  final city = <City>[].obs;

  final isLoading = false.obs;
  States? filterState;
  City? filterCity;
  PlaceModel? place;
  GetStorage? box;

  final responce = <ResponceModal>[].obs;

  HomeController() {
    categoryRepository = CategoryRepository();
    box = GetStorage();
  }

  Future refreshHome({bool showMessage = false}) async {
    await getCategory();
    await states();
  }

  @override
  Future<void> onInit() async {
    await Get.find<AuthService>().checkUserLogin();
    await Get.find<AuthService>().getCurrentUser();
    await refreshHome();
    super.onInit();
    //getHomeList();
  }

  Future getCategory() async {
    index.value = 0;
    filterCategories.clear();
    try {
      categories.assignAll(await categoryRepository!.getCategory());
      await getNews(categories[0].termId.toString());
    } catch (e) {
      // Get.showSnackbar(Ui.errorSnackBar(message: e.toString()));
    }
  }

  Future getNews(String categoryID) async {
    //catId.value = categoryID;
    news.clear();
    Map data = {
      "user_id": Get.find<AuthService>().user.value.userId.toString(),
      "term_id": categoryID,
    };
    try {
      isLoading.value = false;
      news.assignAll(await categoryRepository!.getNews(data));
      isLoading.value = true;
    } catch (e) {
      isLoading.value = true;
      // Get.showSnackbar(Ui.errorSnackBar(message: e.toString()));
    }
  }

  Future getPlaces(String categoryID) async {
    places.clear();
    try {
      isLoading.value = true;
      places.assignAll(await categoryRepository!.getPlaces(categoryID));
      place = places[0];
    } catch (e) {
      // Get.showSnackbar(Ui.errorSnackBar(message: e.toString()));
    }
  }

  Future<Map> likeNews(id) async {
    try {
      Map data = {
        "user_id": Get.find<AuthService>().user.value.userId.toString(),
        "post_id": id,
      };
      isLoading.value = true;
      Map responseData = await categoryRepository!.likeNews(data);
      return responseData;
      // await getCategory();
    } catch (e) {
      isLoading.value = true;
      // Get.showSnackbar(Ui.errorSnackBar(message: e.toString()));
      Map data = {"status": "false"};
      return data;
    }
  }

  Future<Map> bookmarkNews(id) async {
    try {
      Map data = {
        "user_id": Get.find<AuthService>().user.value.userId.toString(),
        "post_id": id,
        "cat_id": "1",
      };
      isLoading.value = true;
      Map response = await categoryRepository!.bookmarkNews(data);
      return response;
      //print(news);

    } catch (e) {
      // Get.showSnackbar(Ui.errorSnackBar(message: e.toString()));
      Map response = {"status": "false"};
      return response;
    }
  }

  Future states() async {
    try {
      isLoading.value = true;
      state.assignAll(await categoryRepository!.state());
      // citys("1");

    } catch (e) {
      // Get.showSnackbar(Ui.errorSnackBar(message: e.toString()));
    }
  }

  Future citys(id) async {
    try {
      isLoading.value = true;
      city.assignAll(await categoryRepository!.city(id));
      //print(news);

    } catch (e) {
      // Get.showSnackbar(Ui.errorSnackBar(message: e.toString()));
    }
  }

  authCheck() {
    return showDialog(
        context: Get.context!, builder: (context) => const AuthPopup());
  }
}
