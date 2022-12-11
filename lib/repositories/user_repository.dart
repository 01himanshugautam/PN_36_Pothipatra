import 'package:get/get.dart';
import 'package:pothipatra/models/user_model.dart';
import 'package:pothipatra/providers/node_provider.dart';

class UserRepository {
  NodeApiClient? nodeApiClient;

  UserRepository();

  Future<UserModal> socialLogin(Map data) {
    nodeApiClient = Get.find<NodeApiClient>();
    return nodeApiClient!.socialLogin(data);
  }
}
