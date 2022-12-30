import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pothipatra/common/auth_popup.dart';
import 'package:pothipatra/models/news_model.dart';
import 'package:pothipatra/modules/news/widgets/news_item_widget.dart';
import 'package:pothipatra/repositories/category_repository.dart';
import 'package:pothipatra/services/auth_service.dart';

import '../../global_widgets/custom_swipe.dart';

class NewsController extends GetxController
    with GetSingleTickerProviderStateMixin {
  AppinioSwiperController swipeController = AppinioSwiperController();

  RxList<NewsItemWidget> newsItemListWidget = <NewsItemWidget>[].obs;
  RxList<News> news = <News>[].obs;
  int initialPage = 1;

  final isLoading = false.obs;
  final postLike = false.obs;
  CategoryRepository? categoryRepository;

  NewsController() {
    categoryRepository = CategoryRepository();
  }

  Future refreshNews({bool showMessage = false, int page = 1}) async {
    await getNews(page: page);
  }

  @override
  Future<void> onInit() async {
    await Get.find<AuthService>().checkUserLogin();
    await Get.find<AuthService>().getCurrentUser();
    await refreshNews();
    super.onInit();
  }

  Future getNews({int page = 1}) async {
    Map data = {
      "user_id": Get.find<AuthService>().user.value.userId.toString(),
      "page_id": page.toString(),
      "term_id": "",
    };
    try {
      isLoading.value = true;
      news.assignAll(await categoryRepository!.getNews(data));
      isLoading.value = false;
      log("News length: ${news.length}");
      for (var element in news) {
        newsItemListWidget.add(NewsItemWidget(
          news: element,
        ));
      }
      refresh();
    } catch (e) {
      isLoading.value = false;
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
      Map response = await categoryRepository!.likeNews(data);
      //await getNews();
      return response;
    } catch (e) {
      isLoading.value = true;
      // Get.showSnackbar(Ui.errorSnackBar(message: e.toString()));
      Map response = {"status": "false"};
      return response;
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
