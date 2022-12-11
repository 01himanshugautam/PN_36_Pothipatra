import 'package:get/get.dart';
import 'package:pothipatra/modules/feed/controller/feed_controller.dart';

class FeedBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FeedController>(
      () => FeedController(),
    );
  }
}
