import 'package:get/get.dart';
import 'package:pothipatra/modules/news/controller/news_controller.dart';

class NewsBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NewsController>(
      () => NewsController(),
    );
  }
}
