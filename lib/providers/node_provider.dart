import 'dart:convert';
import 'package:get_storage/get_storage.dart';
import 'package:pothipatra/models/bookmark_model.dart';
import 'package:pothipatra/models/categories_model.dart';
import 'package:pothipatra/models/city_model.dart';
import 'package:pothipatra/models/filterNewsResponseModel.dart';
import 'package:pothipatra/models/newsDetail_model.dart';
import 'package:pothipatra/models/news_model.dart';
import 'package:pothipatra/models/pages.dart';
import 'package:pothipatra/models/place_model.dart';
import 'package:pothipatra/models/responce_model.dart';
import 'package:pothipatra/models/searchNewsResponseModel.dart';
import 'package:pothipatra/models/state_model.dart';
import 'package:pothipatra/services/auth_service.dart';

import '../models/user_model.dart';
import '../modules/global_widgets/ui.dart';
import 'api_provider.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class NodeApiClient extends GetxService with ApiClient {
  GetStorage? box;

  NodeApiClient() {
    baseUrl = globalService.global.value.nodeBaseUrl;
    box = GetStorage();
  }

  List<Category> category = [];
  List<Category> bookMarkCategory = [];
  List<News> news = [];
  List<SearchNewsResponseModel> searchedNews = [];
  List<FilterNewsResponseModel> filterNews = [];
  List<News> bookMarkNews = [];
  List<Bookmark> bookMark = [];
  List<States> state = [];
  List<City> city = [];
  List<PlaceModel> places = [];

  Future<NodeApiClient> init() async {
    return this;
  }

  Future<UserModal> socialLogin(Map data) async {
    Uri uri = getApiBaseUri("social/login");
    Get.log(json.encode(data));

    var response = await http.post(
      uri,
      body: data,
    );
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      box!.write('login', true);
      box!.write("current_user", jsonResponse);
      Get.log(jsonResponse.toString());
      await Get.find<AuthService>().getCurrentUser();

      return UserModal.fromJson(jsonResponse);
    } else {
      var jsonResponse = json.decode(response.body);
      throw Exception(jsonResponse["message"]);
    }
  }

  Future<List<Category>> getCategory() async {
    Uri uri = getApiBaseUri("user/catelist");
    Get.log(uri.toString());
    var response = await http.get(uri);
    if (response.statusCode == 200) {
      category = parseCategory(response.body);
      return category
          .map<Category>((obj) => Category.fromJson(obj.toJson()))
          .toList();
    } else {
      var jsonResponse = json.decode(response.body);
      throw Exception(jsonResponse["message"]);
    }
  }

  Future<List<Category>> getBookMarkCategory() async {
    Uri uri = getApiBaseUri("/bookmark/list");
    Get.log(uri.toString());
    Map data = {"UserId": Get.find<AuthService>().user.value.userId.toString()};
    var response = await http.post(uri, body: json.encode(data), headers: {
      "Content-type": "application/json",
      "Accept": "application/json",
      'Authorization': 'Bearer ${Get.find<AuthService>().user.value.userId}',
    });
    if (response.statusCode == 200) {
      bookMarkCategory = parseCategory(response.body);
      return bookMarkCategory
          .map<Category>((obj) => Category.fromJson(obj.toJson()))
          .toList();
    } else {
      var jsonResponse = json.decode(response.body);
      throw Exception(jsonResponse["message"]);
    }
  }

  Future<List<SearchNewsResponseModel>> getSearchedNews(
      String searchText) async {
    /*Uri uri = categoryID != ""
        ? getApiBaseUri("user/postlist")
        : getApiBaseUri("posts");
    Get.log(uri.toString());*/
    Uri uri = getApiBaseUri("postsearch?search=$searchText");
    Get.log(uri.toString());
    var response = await http.get(uri);
    /*
    var response = await http.get(uri, headers: {
      "Content-type": "application/json",
      "Accept": "application/json"
    });*/

    print("uri get searched News ------   $uri");
    print("response get searched News ------   ${response.body}");

    if (response.statusCode == 200) {
      searchedNews = parseSearchNews(response.body);
      return searchedNews
          .map<SearchNewsResponseModel>(
              (obj) => SearchNewsResponseModel.fromJson(obj.toJson()))
          .toList();
    } else {
      var jsonResponse = json.decode(response.body);
      throw Exception(jsonResponse["message"]);
    }
  }

  Future<List<News>> getNews(Map data) async {
    /*Uri uri = categoryID != ""
        ? getApiBaseUri("user/postlist")
        : getApiBaseUri("posts");
    Get.log(uri.toString());*/
    Uri uri = getApiBaseUri("user/postlist");
    Get.log(uri.toString());
    Get.log(data.toString());
    var response = await http.post(uri, body: data);
    /*
    var response = await http.get(uri, headers: {
      "Content-type": "application/json",
      "Accept": "application/json"
    });*/

    print("uri getNews ------   $uri with body $data");
    print("response getNews ------   ${response.body}");

    if (response.statusCode == 200) {
      news = parseNews(response.body);
      return news.map<News>((obj) => News.fromJson(obj.toJson())).toList();
    } else {
      var jsonResponse = json.decode(response.body);
      throw Exception(jsonResponse["message"]);
    }
  }

  Future<List<FilterNewsResponseModel>> getFilterNews(Map data) async {
    Uri uri = getApiBaseUri("/filter/postdetails");
    Get.log(uri.toString());
    Get.log(data.toString());
    var response = await http.post(uri, body: data);

    print("uri getFilterNews ------   $uri with body $data");
    print("response getFilterNews ------   ${response.body}");

    if (response.statusCode == 200) {
      filterNews = parseFilterNews(response.body);


      return filterNews.map<FilterNewsResponseModel>((obj) => FilterNewsResponseModel.fromJson(obj.toJson())).toList();
    } else {
      var jsonResponse = json.decode(response.body);
      throw Exception(jsonResponse["message"]);
    }
  }

  Future<List<PlaceModel>> getPlaces(String categoryID) async {
    Uri uri = getApiBaseUri("News/GetPlace/$categoryID");
    Get.log(uri.toString());

    var response = await http.get(uri, headers: {
      "Content-type": "application/json",
      "Accept": "application/json"
    });
    if (response.statusCode == 200) {
      places = parsePlaces(response.body);
      return places
          .map<PlaceModel>((obj) => PlaceModel.fromJson(obj.toJson()))
          .toList();
    } else {
      var jsonResponse = json.decode(response.body);
      throw Exception(jsonResponse["errors"]['search']);
    }
  }

  Future<List<Bookmark>> getBookmarkNewsList() async {
    Uri uri = getApiBaseUri("bookmark/list");
    Get.log(uri.toString());
    Map data = {
      "user_id": Get.find<AuthService>().user.value.userId.toString(),
    };
    Get.log(data.toString());
    var response = await http.post(
      uri,
      body: (data),
    );

    print("uri getBookmarkNewsList ------   $uri with body $data");
    print("response getBookmarkNewsList ------   $response");

    if (response.statusCode == 200) {
      bookMark = parseBookmark(response.body);
      return bookMark
          .map<Bookmark>((obj) => Bookmark.fromJson(obj.toJson()))
          .toList();
    } else {
      var jsonResponse = json.decode(response.body);
      Get.log(data.toString());
      throw Exception(jsonResponse["message"]);
    }
  }

  Future<NewsDetail> getNewsDetail(Map data) async {
    Uri uri = getApiBaseUri("post/details");
    Get.log(data.toString());
    var response = await http.post(
      uri,
      body: data,
    );

    print("uri getNewsDetail ------   $uri with body $data");
    print("response getNewsDetail ------   $response");

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      return NewsDetail.fromJson(jsonResponse);
    } else {
      var jsonResponse = json.decode(response.body);
      throw Exception(jsonResponse["errors"]);
    }
  }

  Future<Map> likeNews(Map data) async {
    Uri uri = getApiBaseUri("share/like");
    var response = await http.post(
      uri,
      body: data,
    );
    Get.log(data.toString());
    Get.log(uri.toString());
    Get.log(response.statusCode.toString());
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      Get.showSnackbar(
          Ui.successSnackBar(message: jsonResponse["like"]["msg"]));
      return jsonResponse;
      /*if (jsonResponse["success"] == true) {
        Get.showSnackbar(Ui.successSnackBar(message: jsonResponse["message"]));
        return ResponceModal.fromJson(jsonResponse);
      } else {
        throw Exception(jsonResponse["errorMessage"]);
      }*/
    } else {
      var jsonResponse = json.decode(response.body);
      throw Exception(jsonResponse["msg"]);
    }
  }

  Future<Map> bookmarkNews(Map data) async {
    Uri uri = getApiBaseUri("bookmark/add");
    Get.log(data.toString());
    Get.log(uri.toString());
    var response = await http.post(
      uri,
      body: data,
    );
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);

      Get.showSnackbar(
          Ui.successSnackBar(message: jsonResponse["bookmark"]["msg"]));
      return jsonResponse;
    } else {
      var jsonResponse = json.decode(response.body);
      throw Exception(jsonResponse["msg"]);
    }
  }

  Future<List<States>> getState() async {
    Uri uri = getApiBaseUri("filter/state");
    Get.log(uri.toString());
    var response = await http.get(uri);
    print("uri get state ------   $uri");
    print("response get state ------   $response");
    if (response.statusCode == 200) {
      state = parseState(response.body);
      return state.map<States>((obj) => States.fromJson(obj.toJson())).toList();
    } else {
      var jsonResponse = json.decode(response.body);
      throw Exception(jsonResponse["errors"]);
    }
  }

  Future<List<City>> getCity(id) async {
    Uri uri = getApiBaseUri("filter/city");
    Get.log(uri.toString());
    Map data = {
      "state": id,
    };
    Get.log(data.toString());
    var response = await http.post(
      uri,
      body: (data),
    );

    print("uri get city ------   $uri with body $data");
    print("response get city ------   $response");
    if (response.statusCode == 200) {
      city = parseCity(response.body);
      return city.map<City>((obj) => City.fromJson(obj.toJson())).toList();
    } else {
      var jsonResponse = json.decode(response.body);
      throw Exception(jsonResponse["errors"]);
    }
  }

  Future<Pages> getPages(id) async {
    Uri uri = getApiBaseUri("pages/$id");
    Get.log(id.toString());
    var response = await http.get(uri);
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      return Pages.fromJson(jsonResponse);
    } else {
      var jsonResponse = json.decode(response.body);
      throw Exception(jsonResponse["errors"]);
    }
  }

  List<Category> parseCategory(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Category>((json) => Category.fromJson(json)).toList();
  }

  List<News> parseNews(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<News>((json) => News.fromJson(json)).toList();
  }

   List<FilterNewsResponseModel> parseFilterNews(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<FilterNewsResponseModel>((json) => FilterNewsResponseModel.fromJson(json)).toList();
  }

  List<SearchNewsResponseModel> parseSearchNews(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed
        .map<SearchNewsResponseModel>(
            (json) => SearchNewsResponseModel.fromJson(json))
        .toList();
  }

  List<Bookmark> parseBookmark(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Bookmark>((json) => Bookmark.fromJson(json)).toList();
  }

  List<States> parseState(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<States>((json) => States.fromJson(json)).toList();
  }

  List<City> parseCity(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<City>((json) => City.fromJson(json)).toList();
  }

  List<PlaceModel> parsePlaces(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<PlaceModel>((json) => PlaceModel.fromJson(json)).toList();
  }
}
