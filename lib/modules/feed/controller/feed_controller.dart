import 'package:get/get.dart';
import 'package:pothipatra/models/feed_item_model.dart';

class FeedController extends GetxController {
  final index = 0.obs;
  final feedList = <FeedItemModel>[].obs;

  Future refreshFeed({bool showMessage = false}) async {}

  @override
  void onInit() {
    super.onInit();
    getFeedList();
  }

  @override
  void onReady() {
    super.onReady();
  }

  getFeedList() {
    feedList.add(FeedItemModel(
        countryname: "Europe",
        desc: "Ukraine president Zelensky to BBC: Blood money being paid",
        newsName: "BBC NEWS",
        time: "14 days ago"));
    feedList.add(FeedItemModel(
        countryname: "Travel",
        desc: "Ukraine president Zelensky to BBC: Blood money being paid",
        newsName: "BBC NEWS",
        time: "10 days ago"));
    feedList.add(FeedItemModel(
        countryname: "Europe",
        desc: "Ukraine president Zelensky to BBC: Blood money being paid",
        newsName: "BBC NEWS",
        time: "12 days ago"));
    feedList.add(FeedItemModel(
        countryname: "Europe",
        desc: "Ukraine president Zelensky to BBC: Blood money being paid",
        newsName: "BBC NEWS",
        time: "5 days ago"));
    feedList.add(FeedItemModel(
        countryname: "Europe",
        desc: "Ukraine president Zelensky to BBC: Blood money being paid",
        newsName: "BBC NEWS",
        time: "2 days ago"));
  }

  List<String> categories = [
    "All",
    "Sports",
    "Politics",
    "Business",
    "Health",
    "Travels",
    "Science",
    "Fashion"
  ];
}
