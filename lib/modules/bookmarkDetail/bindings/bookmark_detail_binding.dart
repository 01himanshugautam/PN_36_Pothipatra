import 'package:get/get.dart';

import '../controller/bookmark_detail_controller.dart';

class BookMarkDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BookMarkDetailController>(
      () => BookMarkDetailController(),
    );
  }
}
