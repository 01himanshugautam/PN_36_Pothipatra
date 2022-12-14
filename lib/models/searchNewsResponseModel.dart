// To parse this JSON data, do
//
//     final searchNewsResponseModel = searchNewsResponseModelFromJson(jsonString);

// ignore_for_file: prefer_if_null_operators

import 'dart:convert';

List<SearchNewsResponseModel> searchNewsResponseModelFromJson(String str) => List<SearchNewsResponseModel>.from(json.decode(str).map((x) => SearchNewsResponseModel.fromJson(x)));

String searchNewsResponseModelToJson(List<SearchNewsResponseModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SearchNewsResponseModel {
    SearchNewsResponseModel({
        this.like,
        this.love,
        this.likecount,
        this.image,
        this.category,
        this.postData,
    });

    bool ?like;
    bool ?love;
    String? likecount;
    dynamic image;
    List<Categoryy>? category;
    PostData? postData;

    factory SearchNewsResponseModel.fromJson(Map<String, dynamic> json) => SearchNewsResponseModel(
        like: json["like"] == null ? null : json["like"],
        love: json["love"] == null ? null : json["love"],
        likecount: json["likecount"] == null ? null : json["likecount"],
        image: json["image"],
        category: json["category"] == null ? null : List<Categoryy>.from(json["category"].map((x) => Categoryy.fromJson(x))),
        postData: json["post_data"] == null ? null : PostData.fromJson(json["post_data"]),
    );

    Map<String, dynamic> toJson() => {
        "like": like == null ? null : like,
        "love": love == null ? null : love,
        "likecount": likecount == null ? null : likecount,
        "image": image,
        "category": category == null ? null : List<dynamic>.from(category!.map((x) => x.toJson())),
        "post_data": postData == null ? null : postData!.toJson(),
    };
}

class Categoryy {
    Categoryy({
        this.name,
        this.id,
    });

    String ?name;
    int ?id;

    factory Categoryy.fromJson(Map<String, dynamic> json) => Categoryy(
        name: json["name"] == null ? null : json["name"],
        id: json["id"] == null ? null : json["id"],
    );

    Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "id": id == null ? null : id,
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
    });

    String? id;
    String ?postAuthor;
    DateTime? postDate;
    DateTime ?postDateGmt;
    String ?postContent;
    String ?postTitle;
    String ?postExcerpt;
    String ?postStatus;
    String ?commentStatus;
    String? pingStatus;
    String? postPassword;
    String? postName;
    String? toPing;
    String? pinged;
    DateTime ?postModified;
    DateTime ?postModifiedGmt;
    String? postContentFiltered;
    String? postParent;
    String? guid;
    String? menuOrder;
    String? postType;
    String? postMimeType;
    String? commentCount;

    factory PostData.fromJson(Map<String, dynamic> json) => PostData(
        id: json["ID"] == null ? null : json["ID"],
        postAuthor: json["post_author"] == null ? null : json["post_author"],
        postDate: json["post_date"] == null ? null : DateTime.parse(json["post_date"]),
        postDateGmt: json["post_date_gmt"] == null ? null : DateTime.parse(json["post_date_gmt"]),
        postContent: json["post_content"] == null ? null : json["post_content"],
        postTitle: json["post_title"] == null ? null : json["post_title"],
        postExcerpt: json["post_excerpt"] == null ? null : json["post_excerpt"],
        postStatus: json["post_status"] == null ? null : json["post_status"],
        commentStatus: json["comment_status"] == null ? null : json["comment_status"],
        pingStatus: json["ping_status"] == null ? null : json["ping_status"],
        postPassword: json["post_password"] == null ? null : json["post_password"],
        postName: json["post_name"] == null ? null : json["post_name"],
        toPing: json["to_ping"] == null ? null : json["to_ping"],
        pinged: json["pinged"] == null ? null : json["pinged"],
        postModified: json["post_modified"] == null ? null : DateTime.parse(json["post_modified"]),
        postModifiedGmt: json["post_modified_gmt"] == null ? null : DateTime.parse(json["post_modified_gmt"]),
        postContentFiltered: json["post_content_filtered"] == null ? null : json["post_content_filtered"],
        postParent: json["post_parent"] == null ? null : json["post_parent"],
        guid: json["guid"] == null ? null : json["guid"],
        menuOrder: json["menu_order"] == null ? null : json["menu_order"],
        postType: json["post_type"] == null ? null : json["post_type"],
        postMimeType: json["post_mime_type"] == null ? null : json["post_mime_type"],
        commentCount: json["comment_count"] == null ? null : json["comment_count"],
    );

    Map<String, dynamic> toJson() => {
        "ID": id == null ? null : id,
        "post_author": postAuthor == null ? null : postAuthor,
        "post_date": postDate == null ? null : postDate!.toIso8601String(),
        "post_date_gmt": postDateGmt == null ? null : postDateGmt!.toIso8601String(),
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
        "post_modified": postModified == null ? null : postModified!.toIso8601String(),
        "post_modified_gmt": postModifiedGmt == null ? null : postModifiedGmt!.toIso8601String(),
        "post_content_filtered": postContentFiltered == null ? null : postContentFiltered,
        "post_parent": postParent == null ? null : postParent,
        "guid": guid == null ? null : guid,
        "menu_order": menuOrder == null ? null : menuOrder,
        "post_type": postType == null ? null : postType,
        "post_mime_type": postMimeType == null ? null : postMimeType,
        "comment_count": commentCount == null ? null : commentCount,
    };
}
