import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pothipatra/models/filterNewsResponseModel.dart';
import 'package:pothipatra/models/news_model.dart';
import 'package:pothipatra/models/searchNewsResponseModel.dart';
import 'package:pothipatra/repositories/category_repository.dart';

import '../../../common/auth_popup.dart';
import '../../../services/auth_service.dart';
import '../../global_widgets/ui.dart';

class SearchController extends GetxController {
  final searchNews = <News>[].obs;
  final filterNews = <FilterNewsResponseModel>[].obs;
  final searchedNews = <SearchNewsResponseModel>[].obs;
  final isLoading = false.obs;
  CategoryRepository? categoryRepository;
  GetStorage? box;

  String searchText = "";

  SearchController() {
    categoryRepository = CategoryRepository();
    box = GetStorage();
  }

  @override
  Future<void> onInit() async {
    await Get.find<AuthService>().getCurrentUser();
    super.onInit();
  }

  Future getSearchNews() async {
    try {
      isLoading.value = false;
      // Map data = {
      //   "CategoryId": "",
      //   "HeaderSearch": searchText,
      //   // "PlaceId": "",
      //   // "Skip": 0,
      //   // "Take": 0,
      //   "UserId": Get.find<AuthService>().user.value.userId.toString(),
      // };
      isLoading.value = true;
      searchedNews
          .assignAll(await categoryRepository!.getSearchedNews(searchText));
     
    } catch (e) {
      isLoading.value = true;
      Get.showSnackbar(Ui.errorSnackBar(message: e.toString()));
    }
  }

  Future getFilterNews(String city) async {
    try {
      Map data = {
        "city": city,
      };
      isLoading.value = true;
      filterNews.assignAll(await categoryRepository!.getFilterNews(data));
    } catch (e) {
      Get.showSnackbar(Ui.errorSnackBar(message: e.toString()));
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
      Get.showSnackbar(Ui.errorSnackBar(message: e.toString()));
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
      Get.showSnackbar(Ui.errorSnackBar(message: e.toString()));
      Map response = {"status": "false"};
      return response;
    }
  }

  authCheck() {
    return showDialog(
        context: Get.context!, builder: (context) => const AuthPopup());
  }
}
