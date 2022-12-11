import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pothipatra/models/user_model.dart';
import 'package:pothipatra/repositories/user_repository.dart';

class AuthService extends GetxService {
  final user = UserModal().obs;

  GetStorage? _box;
  UserRepository? userRepository;
  bool? isUserLoggedin = false;

  AuthService() {
    userRepository = UserRepository();
    _box = GetStorage();
  }

  Future<AuthService> init() async {
    await checkUserLogin();
    await getCurrentUser();
    return this;
  }

  Future checkUserLogin() async {
    if (_box!.hasData('login')) {
      isUserLoggedin = _box!.read("login");
    } else {
      isUserLoggedin = false;
    }
  }

  Future<UserModal?> getCurrentUser() async {
    if (_box != null && _box!.hasData('current_user')) {
      user.value = UserModal.fromJson(await _box!.read('current_user'));
      return user.value;
    } else {
      return null;
    }
  }

  Future removeCurrentUser() async {
    await _box!.remove('login');
  }

  bool get isAuth => isUserLoggedin!;
}
