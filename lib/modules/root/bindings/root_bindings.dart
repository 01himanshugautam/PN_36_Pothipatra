import 'package:get/get.dart';
import 'package:pothipatra/modules/bookmark/controller/bookmark_controller.dart';
import 'package:pothipatra/modules/feed/controller/feed_controller.dart';
import 'package:pothipatra/modules/home/controller/home_controller.dart';
import 'package:pothipatra/modules/news/controller/news_controller.dart';
import 'package:pothipatra/modules/profile/controller/profile_controller.dart';
import 'package:pothipatra/modules/profile/controller/theme_mode_controller.dart';

import '../controllers/root_controller.dart';

class RootBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RootController>(() => RootController());

    Get.lazyPut<FeedController>(() => FeedController());
    Get.put(FeedController(), permanent: true);

    Get.lazyPut<NewsController>(() => NewsController());
    Get.put(NewsController(), permanent: true);

    Get.lazyPut<BookMarkController>(() => BookMarkController());
    Get.put(BookMarkController(), permanent: true);

    Get.lazyPut<HomeController>(() => HomeController());
    Get.put(HomeController(), permanent: true);

    Get.lazyPut<ProfileController>(() => ProfileController());
    Get.put(ProfileController(), permanent: true);

    Get.lazyPut<ThemeModeController>(() => ThemeModeController());
    Get.put(ThemeModeController(), permanent: true);
  }
}
