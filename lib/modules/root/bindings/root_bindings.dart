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
    Get.lazyPut<RootController>(
      () => RootController(),
    );

    Get.put(FeedController(), permanent: true);
    Get.put(NewsController(), permanent: true);
    Get.put(BookMarkController(), permanent: true);
    Get.put(HomeController(), permanent: true);
    Get.put(ProfileController(), permanent: true);
    Get.put(ThemeModeController(), permanent: true);

    Get.lazyPut<FeedController>(
      () => FeedController(),
    );
    Get.lazyPut<NewsController>(
      () => NewsController(),
    );
    Get.lazyPut<BookMarkController>(
      () => BookMarkController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<ProfileController>(
      () => ProfileController(),
    );
    Get.lazyPut<ThemeModeController>(
      () => ThemeModeController(),
    );
  }
}
