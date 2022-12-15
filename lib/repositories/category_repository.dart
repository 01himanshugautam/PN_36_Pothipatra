import 'package:get/get.dart';
import 'package:pothipatra/models/bookmark_model.dart';
import 'package:pothipatra/models/categories_model.dart';
import 'package:pothipatra/models/city_model.dart';
import 'package:pothipatra/models/filterNewsResponseModel.dart';
import 'package:pothipatra/models/newsDetail_model.dart';
import 'package:pothipatra/models/news_model.dart';
import 'package:pothipatra/models/pages.dart';
import 'package:pothipatra/models/place_model.dart';
import 'package:pothipatra/models/searchNewsResponseModel.dart';
import 'package:pothipatra/models/state_model.dart';

import '../providers/node_provider.dart';

class CategoryRepository {
  NodeApiClient? nodeApiClient;

  CategoryRepository() {
    nodeApiClient = Get.find<NodeApiClient>();
  }

  Future<List<Category>> getCategory() {
    return nodeApiClient!.getCategory();
  }

  Future<List<Category>> getBookMarkCategory() {
    return nodeApiClient!.getBookMarkCategory();
  }

  Future<List<Bookmark>> getBookMarkNewsList() {
    return nodeApiClient!.getBookmarkNewsList();
  }

  Future<List<News>> getNews(Map data) {
    return nodeApiClient!.getNews(data);
  }

  Future<List<SearchNewsResponseModel>> getSearchedNews(String searchText) {
    return nodeApiClient!.getSearchedNews(searchText);
  }

  Future<List<FilterNewsResponseModel>> getFilterNews(Map data) {
    return nodeApiClient!.getFilterNews(data);
  }

  Future<List<PlaceModel>> getPlaces(String categoryID) {
    return nodeApiClient!.getPlaces(categoryID);
  }

  Future<NewsDetail> getNewDetail(Map data) {
    return nodeApiClient!.getNewsDetail(data);
  }

  Future<Map> likeNews(Map data) {
    return nodeApiClient!.likeNews(data);
  }

  Future<Map> bookmarkNews(Map data) {
    return nodeApiClient!.bookmarkNews(data);
  }

  Future<List<States>> state() {
    return nodeApiClient!.getState();
  }

  Future<List<City>> city(data) {
    return nodeApiClient!.getCity(data);
  }

  Future<Pages> getPages(id) {
    return nodeApiClient!.getPages(id);
  }
}
