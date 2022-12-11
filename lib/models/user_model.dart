import 'package:pothipatra/models/parent/model.dart';

class UserModal extends Model {
  int? userId;
  String? name;
  String? email;
  String? photoUrl;
  String? provider;
  String? message;

  UserModal(
      {
      this.userId,
      this.name,
      this.email,
      this.photoUrl,
      this.provider,
      this.message});

  UserModal.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    name = json['username'];
    email = json['email'];
    photoUrl = json['picture'];
    provider = json['provider'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userId;
    data['username'] = name;
    data['email'] = email;
    data['picture'] = photoUrl;
    data['provider'] = provider;
    data['message'] = message;
    return data;
  }
}
