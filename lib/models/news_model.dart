// To parse this JSON data, do
//
//     final news = newsFromJson(jsonString);

// ignore_for_file: prefer_if_null_operators

import 'dart:convert';

List<News> newsFromJson(String str) =>
    List<News>.from(json.decode(str).map((x) => News.fromJson(x)));

String newsToJson(List<News> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class News {
  News({
    this.ads,
    this.bookmark2,
    this.like,
    this.love,
    this.likecount,
    this.image,
    this.category,
    this.postData,
  });

  Map<String, dynamic>? ads;
  bool? bookmark2;
  bool? like;
  bool? love;
  String? likecount;
  String? image;
  List<NewsCategory>? category;
  PostData? postData;

  factory News.fromJson(Map<String, dynamic> json) => News(
        ads: json["ads"] == null ? null : json["ads"],
        bookmark2: json["bookmark2"] == null ? null : json["bookmark2"],
        like: json["like"] == null ? null : json["like"],
        love: json["love"] == null ? null : json["love"],
        likecount: json["likecount"] == null ? null : json["likecount"],
        image: json["image"] == null ? null : json["image"],
        category: json["category"] == null
            ? null
            : List<NewsCategory>.from(
                json["category"].map((x) => NewsCategory.fromJson(x)),
              ),
        postData: json["post_data"] == null
            ? null
            : PostData.fromJson(json["post_data"]),
      );

  Map<String, dynamic> toJson() => {
        "ads": ads == null ? null : ads,
        "bookmark2": bookmark2 == null ? null : bookmark2,
        "like": like == null ? null : like,
        "love": love == null ? null : love,
        "likecount": likecount == null ? null : likecount,
        "image": image == null ? null : image,
        "category": category == null
            ? null
            : List<dynamic>.from(category!.map((x) => x.toJson())),
        "post_data": postData == null ? null : postData!.toJson(),
      };
}

class Ads {
  Ads({
    this.the0,
    this.image,
  });

  PostData? the0;
  String? image;

  factory Ads.fromJson(Map<String, dynamic> json) => Ads(
        the0: json["0"] == null ? null : PostData.fromJson(json["0"]),
        image: json["image"] == null ? null : json["image"],
      );

  Map<String, dynamic> toJson() => {
        "0": the0 == null ? null : the0!.toJson(),
        "image": image == null ? null : image,
      };
}

class PostData {
  PostData({
    this.id,
    this.postAuthor,
    this.postDate,
    this.postDateGmt,
    this.postContent,
    this.postTitle,
    this.postExcerpt,
    this.postStatus,
    this.commentStatus,
    this.pingStatus,
    this.postPassword,
    this.postName,
    this.toPing,
    this.pinged,
    this.postModified,
    this.postModifiedGmt,
    this.postContentFiltered,
    this.postParent,
    this.guid,
    this.menuOrder,
    this.postType,
    this.postMimeType,
    this.commentCount,
    this.filter,
  });

  int? id;
  String? postAuthor;
  DateTime? postDate;
  DateTime? postDateGmt;
  String? postContent;
  String? postTitle;
  String? postExcerpt;
  String? postStatus;
  String? commentStatus;
  String? pingStatus;
  String? postPassword;
  String? postName;
  String? toPing;
  String? pinged;
  DateTime? postModified;
  DateTime? postModifiedGmt;
  String? postContentFiltered;
  int? postParent;
  String? guid;
  int? menuOrder;
  String? postType;
  String? postMimeType;
  String? commentCount;
  String? filter;

  factory PostData.fromJson(Map<String, dynamic> json) => PostData(
        id: json["ID"] == null ? null : json["ID"],
        postAuthor: json["post_author"] == null ? null : json["post_author"],
        postDate: json["post_date"] == null
            ? null
            : DateTime.parse(json["post_date"]),
        postDateGmt: json["post_date_gmt"] == null
            ? null
            : DateTime.parse(json["post_date_gmt"]),
        postContent: json["post_content"] == null ? null : json["post_content"],
        postTitle: json["post_title"] == null ? null : json["post_title"],
        postExcerpt: json["post_excerpt"] == null ? null : json["post_excerpt"],
        postStatus: json["post_status"] == null ? null : json["post_status"],
        commentStatus:
            json["comment_status"] == null ? null : json["comment_status"],
        pingStatus: json["ping_status"] == null ? null : json["ping_status"],
        postPassword:
            json["post_password"] == null ? null : json["post_password"],
        postName: json["post_name"] == null ? null : json["post_name"],
        toPing: json["to_ping"] == null ? null : json["to_ping"],
        pinged: json["pinged"] == null ? null : json["pinged"],
        postModified: json["post_modified"] == null
            ? null
            : DateTime.parse(json["post_modified"]),
        postModifiedGmt: json["post_modified_gmt"] == null
            ? null
            : DateTime.parse(json["post_modified_gmt"]),
        postContentFiltered: json["post_content_filtered"] == null
            ? null
            : json["post_content_filtered"],
        postParent: json["post_parent"] == null ? null : json["post_parent"],
        guid: json["guid"] == null ? null : json["guid"],
        menuOrder: json["menu_order"] == null ? null : json["menu_order"],
        postType: json["post_type"] == null ? null : json["post_type"],
        postMimeType:
            json["post_mime_type"] == null ? null : json["post_mime_type"],
        commentCount:
            json["comment_count"] == null ? null : json["comment_count"],
        filter: json["filter"] == null ? null : json["filter"],
      );

  Map<String, dynamic> toJson() => {
        "ID": id == null ? null : id,
        "post_author": postAuthor == null ? null : postAuthor,
        "post_date": postDate == null ? null : postDate!.toIso8601String(),
        "post_date_gmt":
            postDateGmt == null ? null : postDateGmt!.toIso8601String(),
        "post_content": postContent == null ? null : postContent,
        "post_title": postTitle == null ? null : postTitle,
        "post_excerpt": postExcerpt == null ? null : postExcerpt,
        "post_status": postStatus == null ? null : postStatus,
        "comment_status": commentStatus == null ? null : commentStatus,
        "ping_status": pingStatus == null ? null : pingStatus,
        "post_password": postPassword == null ? null : postPassword,
        "post_name": postName == null ? null : postName,
        "to_ping": toPing == null ? null : toPing,
        "pinged": pinged == null ? null : pinged,
        "post_modified":
            postModified == null ? null : postModified!.toIso8601String(),
        "post_modified_gmt":
            postModifiedGmt == null ? null : postModifiedGmt!.toIso8601String(),
        "post_content_filtered":
            postContentFiltered == null ? null : postContentFiltered,
        "post_parent": postParent == null ? null : postParent,
        "guid": guid == null ? null : guid,
        "menu_order": menuOrder == null ? null : menuOrder,
        "post_type": postType == null ? null : postType,
        "post_mime_type": postMimeType == null ? null : postMimeType,
        "comment_count": commentCount == null ? null : commentCount,
        "filter": filter == null ? null : filter,
      };
}

// enum Status { CLOSED, OPEN }

// final statusValues = EnumValues({"closed": Status.CLOSED, "open": Status.OPEN});

// enum Filter { RAW }

// final filterValues = EnumValues({"raw": Filter.RAW});

// enum PostStatus { PUBLISH }

// final postStatusValues = EnumValues({"publish": PostStatus.PUBLISH});

// enum PostType { SUPER_SIMPLE_SLIDER, POST }

// final postTypeValues = EnumValues({
//   "post": PostType.POST,
//   "super-simple-slider": PostType.SUPER_SIMPLE_SLIDER
// });

class NewsCategory {
  NewsCategory({
    this.name,
    this.id,
  });

  String? name;
  int? id;

  factory NewsCategory.fromJson(Map<String, dynamic> json) => NewsCategory(
        name: json["name"] == null ? null : json["name"],
        id: json["id"] == null ? null : json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "id": id == null ? null : id,
      };
}

// class EnumValues<T> {
//   Map<String, T> map;
//   Map<T, String> reverseMap;

//   EnumValues(this.map);

//   Map<T, String> get reverse {
//     if (reverseMap == null) {
//       reverseMap = map.map((k, v) => new MapEntry(v, k));
//     }
//     return reverseMap;
//   }
// }

// class News {
//   dynamic ads;
//   bool? bookmark2;
//   bool? like;
//   bool? love;
//   String? likecount;
//   String? image;
//   List<Categorys>? category;
//   PostData? postData;

//   News(
//       {this.ads,
//       this.bookmark2,
//       this.like,
//       this.love,
//       this.image,
//       this.category,
//       this.postData});

//   News.fromJson(Map<String, dynamic> json) {
//     // ads=
//     // json["ads"] == null
//     //     ? null
//     //     : List<PostData>.from(json["ads"].map((x) => PostData.fromJson(x)));
//     // if (json['ads'] != []) {
//     //   ads = <PostData>[];
//     //   json['ads'].forEach((v) {
//     //     ads!.add(PostData.fromJson(v));
//     //   });
//     // }
//     // ads=
//     // json["ads"];
//     bookmark2 = json['bookmark2'];
//     like = json['like'];
//     love = json['love'];
//     likecount = json['likecount'];
//     image = json['image'];
//     if (json['category'] != null) {
//       category = <Categorys>[];
//       json['category'].forEach((v) {
//         category!.add(Categorys.fromJson(v));
//       });
//     }
//     postData =
//         json['post_data'] != null ? PostData.fromJson(json['post_data']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = Map<String, dynamic>();
//     data['bookmark2'] = bookmark2;
//     data['like'] = like;
//     data['love'] = love;
//     data['likecount'] = likecount;
//     data['image'] = image;
//     if (category != null) {
//       data['category'] = category!.map((v) => v.toJson()).toList();
//     }
//     if (postData != null) {
//       data['post_data'] = postData!.toJson();
//     }
//     return data;
//   }
// }

// class Categorys {
//   String? name;
//   int? id;

//   Categorys({this.name, this.id});

//   Categorys.fromJson(Map<String, dynamic> json) {
//     name = json['name'];
//     id = json['id'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = Map<String, dynamic>();
//     data['name'] = name;
//     data['id'] = id;
//     return data;
//   }
// }

// class PostData {
//   int? id;
//   String? postAuthor;
//   String? postDate;
//   String? postDateGmt;
//   String? postContent;
//   String? postTitle;
//   String? postExcerpt;
//   String? postStatus;
//   String? commentStatus;
//   String? pingStatus;
//   String? postPassword;
//   String? postName;
//   String? toPing;
//   String? pinged;
//   String? postModified;
//   String? postModifiedGmt;
//   String? postContentFiltered;
//   int? postParent;
//   String? guid;
//   int? menuOrder;
//   String? postType;
//   String? postMimeType;
//   String? commentCount;
//   String? filter;

//   PostData(
//       {this.id,
//       this.postAuthor,
//       this.postDate,
//       this.postDateGmt,
//       this.postContent,
//       this.postTitle,
//       this.postExcerpt,
//       this.postStatus,
//       this.commentStatus,
//       this.pingStatus,
//       this.postPassword,
//       this.postName,
//       this.toPing,
//       this.pinged,
//       this.postModified,
//       this.postModifiedGmt,
//       this.postContentFiltered,
//       this.postParent,
//       this.guid,
//       this.menuOrder,
//       this.postType,
//       this.postMimeType,
//       this.commentCount,
//       this.filter});

//   PostData.fromJson(Map<String, dynamic> json) {
//     id = json['ID'];
//     postAuthor = json['post_author'];
//     postDate = json['post_date'];
//     postDateGmt = json['post_date_gmt'];
//     postContent = json['post_content'];
//     postTitle = json['post_title'];
//     postExcerpt = json['post_excerpt'];
//     postStatus = json['post_status'];
//     commentStatus = json['comment_status'];
//     pingStatus = json['ping_status'];
//     postPassword = json['post_password'];
//     postName = json['post_name'];
//     toPing = json['to_ping'];
//     pinged = json['pinged'];
//     postModified = json['post_modified'];
//     postModifiedGmt = json['post_modified_gmt'];
//     postContentFiltered = json['post_content_filtered'];
//     postParent = json['post_parent'];
//     guid = json['guid'];
//     menuOrder = json['menu_order'];
//     postType = json['post_type'];
//     postMimeType = json['post_mime_type'];
//     commentCount = json['comment_count'];
//     filter = json['filter'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = Map<String, dynamic>();
//     data['ID'] = id;
//     data['post_author'] = postAuthor;
//     data['post_date'] = postDate;
//     data['post_date_gmt'] = postDateGmt;
//     data['post_content'] = postContent;
//     data['post_title'] = postTitle;
//     data['post_excerpt'] = postExcerpt;
//     data['post_status'] = postStatus;
//     data['comment_status'] = commentStatus;
//     data['ping_status'] = pingStatus;
//     data['post_password'] = postPassword;
//     data['post_name'] = postName;
//     data['to_ping'] = toPing;
//     data['pinged'] = pinged;
//     data['post_modified'] = postModified;
//     data['post_modified_gmt'] = postModifiedGmt;
//     data['post_content_filtered'] = postContentFiltered;
//     data['post_parent'] = postParent;
//     data['guid'] = guid;
//     data['menu_order'] = menuOrder;
//     data['post_type'] = postType;
//     data['post_mime_type'] = postMimeType;
//     data['comment_count'] = commentCount;
//     data['filter'] = filter;
//     return data;
//   }
// }
