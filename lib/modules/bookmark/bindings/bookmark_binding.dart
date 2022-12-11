import 'package:get/get.dart';
import 'package:pothipatra/modules/bookmark/controller/bookmark_controller.dart';

class BookMarkBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BookMarkController>(
      () => BookMarkController(),
    );
  }
}
