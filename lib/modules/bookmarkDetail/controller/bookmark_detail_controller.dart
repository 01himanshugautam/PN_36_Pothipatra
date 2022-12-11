import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pothipatra/common/auth_popup.dart';
import 'package:pothipatra/models/categories_model.dart';
import 'package:pothipatra/models/newsDetail_model.dart';
import 'package:pothipatra/models/user_model.dart';
import 'package:pothipatra/modules/global_widgets/ui.dart';
import 'package:pothipatra/repositories/category_repository.dart';
import 'package:pothipatra/services/auth_service.dart';

class BookMarkDetailController extends GetxController {
  final index = 0.obs;
  var news = NewsDetail().obs;
  final isLoading = false.obs;
  CategoryRepository? categoryRepository;
  final categoriesall = <Category>[].obs;
  GetStorage? box;

  BookMarkDetailController() {
    categoryRepository = CategoryRepository();
    box = GetStorage();

  }
  Future refreshDetail({bool showMessage = false}) async {
    await getNewsDetails();
   // await getCategory();

  }
  @override
  Future<void> onInit() async {
    await refreshDetail();
    await Get.find<AuthService>().getCurrentUser();
    super.onInit();
  }

  Future getNewsDetails() async {
    try {
      isLoading.value = false;
      Map data = {
        "postid":box!.read("postid"),
      };
      news.value = await categoryRepository!.getNewDetail(data);
      isLoading.value = true;

    } catch (e) {
      Get.showSnackbar(Ui.errorSnackBar(message: e.toString()));
    } finally {
      isLoading.value = true;
    }
  }
  Future getCategory() async {
    try {
      isLoading.value = true;
      categoriesall.assignAll(await categoryRepository!.getCategory());
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
    } catch (e) {
      isLoading.value = true;
      Get.showSnackbar(Ui.errorSnackBar(message: e.toString()));
      Map data = {"status": "false"};
      return data;
    }
  }

  authCheck() {
    return showDialog(
        context: Get.context!, builder: (context) => const AuthPopup());
  }
}
