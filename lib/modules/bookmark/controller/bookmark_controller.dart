import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pothipatra/common/auth_popup.dart';
import 'package:pothipatra/models/bookmark_model.dart';
import 'package:pothipatra/models/categories_model.dart';
import 'package:pothipatra/models/news_model.dart';
import 'package:pothipatra/models/user_model.dart';
import 'package:pothipatra/modules/global_widgets/ui.dart';
import 'package:pothipatra/repositories/category_repository.dart';
import 'package:pothipatra/services/auth_service.dart';

import '../../../models/bookmark_item_model.dart';

class BookMarkController extends GetxController {
  final index = 0.obs;
  final category = <BookMarkItemModel>[].obs;
  final hideIcon = true.obs;

  CategoryRepository? categoryRepository;
  final bookMarkCategories = <Category>[].obs;
  final bookMarkNews = <Bookmark>[].obs;
  final isLoading = false.obs;
  GetStorage? box;

  BookMarkController() {
    categoryRepository = CategoryRepository();
    box = GetStorage();
  }
  Future refreshCategory({bool showMessage = false}) async {
    await getBookMarkNews();
  }

  @override
  Future<void> onInit() async {
    await Get.find<AuthService>().getCurrentUser();
    await refreshCategory();
    super.onInit();
  }

  /*Future getCategory() async {
    index.value = 0;
    try {
      isLoading.value = true;
      bookMarkCategories
          .assignAll(await categoryRepository!.getBookMarkCategory());
      if (bookMarkCategories.isNotEmpty) {
        await getBookMarkNews(bookMarkCategories[0].termId.toString());
      }
    } catch (e) {
     // Get.showSnackbar(Ui.errorSnackBar(message: e.toString()));
    }
  }*/

  Future getBookMarkNews() async {
    try {
      isLoading.value = false;
      bookMarkNews.assignAll(await categoryRepository!.getBookMarkNewsList());
      isLoading.value = true;
    } catch (e) {
      isLoading.value = true;
      //Get.showSnackbar(Ui.errorSnackBar(message: e.toString()));
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

  authCheck() {
    return showDialog(
        context: Get.context!, builder: (context) => const AuthPopup());
  }
}
