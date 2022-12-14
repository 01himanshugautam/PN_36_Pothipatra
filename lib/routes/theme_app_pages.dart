import 'package:get/route_manager.dart';
import 'package:pothipatra/modules/bookmark/bindings/bookmark_binding.dart';
import 'package:pothipatra/modules/bookmark/views/bookmark_view.dart';
import 'package:pothipatra/modules/feed/bindings/feed_binding.dart';
import 'package:pothipatra/modules/feed/views/feed_view.dart';
import 'package:pothipatra/modules/home/bindings/home_binding.dart';
import 'package:pothipatra/modules/home/views/home_view.dart';
import 'package:pothipatra/modules/news/bindings/news_binding.dart';
import 'package:pothipatra/modules/news/views/news_view.dart';
import 'package:pothipatra/modules/profile/bindings/profile_binding.dart';
import 'package:pothipatra/modules/profile/views/about_view.dart';
import 'package:pothipatra/modules/profile/views/privacy_view.dart';
import 'package:pothipatra/modules/profile/views/profile_view.dart';
import 'package:pothipatra/modules/profile/views/terms_condition.dart';
import 'package:pothipatra/modules/profile/views/theme_mode_view.dart';
import 'package:pothipatra/modules/root/bindings/root_bindings.dart';
import 'package:pothipatra/modules/root/views/root_view.dart';
import 'package:pothipatra/modules/search/views/filter_view.dart';
import 'package:pothipatra/modules/splash/view/welcome_view.dart';

import '../modules/auth/bindings/auth_binding.dart';
import '../modules/auth/views/login_view.dart';
import '../modules/bookmarkDetail/bindings/bookmark_detail_binding.dart';
import '../modules/bookmarkDetail/views/bookmark_detail_view.dart';
import '../modules/search/bindings/search_binding.dart';
import '../modules/search/views/search_view.dart';
import '../modules/splash/view/splash_view.dart';

part 'app_routes.dart';

class ThemeAppPages {
  static const intital = Routes.splash;

  static final routes = [
    GetPage(
        name: Routes.login,
        page: () => const LoginView(),
        binding: AuthBinding()),
    GetPage(name: Routes.splash, page: () => const SplashView()),
    GetPage(name: Routes.welcome, page: () => const WelcomeView()),
    GetPage(
        name: Routes.root,
        page: () => const RootView(),
        binding: RootBinding()),
    GetPage(name: Routes.root, page: () => FeedView(), binding: FeedBinding()),
    GetPage(
        name: Routes.root,
        page: () => const NewsView(),
        binding: NewsBindings()),
    GetPage(
        name: Routes.root,
        page: () => const HomeView(),
        binding: HomeBinding()),
    GetPage(
        name: Routes.profile,
        page: () => const ProfileView(),
        binding: ProfileBinding()),
    GetPage(
        name: Routes.theme,
        page: () => ThemeModeView(),
        binding: RootBinding()),
    GetPage(
        name: Routes.root,
        page: () => const BookMarkView(),
        binding: BookMarkBinding()),
    GetPage(
        name: Routes.bookmarkDetail,
        page: () => BookMarkDetailView(),
        binding: BookMarkDetailBinding()),
    GetPage(
        name: Routes.search,
        page: () => SearchView(),
        binding: SearchBinding()),
    GetPage(
      name: Routes.terms,
      page: () => const TermsCondition(),
    ),
    GetPage(
      name: Routes.about,
      page: () => AboutView(),
    ),
    GetPage(
      name: Routes.privacy,
      page: () => const PrivacyView(),
    ),
    GetPage(
        name: Routes.filter,
        page: () => const FilterView(),
        binding: SearchBinding()),
  ];
}
