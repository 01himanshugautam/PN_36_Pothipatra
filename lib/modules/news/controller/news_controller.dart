import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pothipatra/common/auth_popup.dart';
import 'package:pothipatra/models/news_model.dart';
import 'package:pothipatra/modules/global_widgets/ui.dart';
import 'package:pothipatra/modules/news/widgets/ads_item_widget.dart';
import 'package:pothipatra/modules/news/widgets/news_item_widget.dart';
import 'package:pothipatra/repositories/category_repository.dart';
import 'package:pothipatra/services/auth_service.dart';

import '../../global_widgets/custom_swipe.dart';

class NewsController extends GetxController
    with GetSingleTickerProviderStateMixin {
  AppinioSwiperController swipeController = AppinioSwiperController();

  RxList<NewsItemWidget> newsItemListWidget = <NewsItemWidget>[].obs;
  RxList<AdsItemWidget> adsItemListWidget = <AdsItemWidget>[].obs;
  RxList<News> news = <News>[].obs;

  final isLoading = false.obs;
  CategoryRepository? categoryRepository;

  NewsController() {
    categoryRepository = CategoryRepository();
  }

  Future refreshNews({bool showMessage = false}) async {
    await getNews();
  }

  @override
  Future<void> onInit() async {
    await Get.find<AuthService>().checkUserLogin();
    await Get.find<AuthService>().getCurrentUser();
    await refreshNews();
    super.onInit();
  }

  Future getNews() async {
    try {
      Map data = {
        "user_id": Get.find<AuthService>().user.value.userId.toString(),
        "term_id": "",
      };
      //  isLoading.value = false;

      news.assignAll(await categoryRepository!.getNews(data));

      isLoading.value = true;
      for (var element in news) {
        newsItemListWidget.add(NewsItemWidget(
          news: element,
        ));
      }

      refresh();

      //newsItemListWidget.value = newsItemListWidget;
    } catch (e) {
      isLoading.value = true;
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
      Map response = await categoryRepository!.likeNews(data);
      //await getNews();
      return response;
    } catch (e) {
      isLoading.value = true;
      Get.showSnackbar(Ui.errorSnackBar(message: e.toString()));
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
