import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pothipatra/repositories/user_repository.dart';
import 'package:pothipatra/routes/theme_app_pages.dart';

class AuthController extends GetxController {
  late GlobalKey<FormState> loginFormKey;
  final loading = false.obs;
  final hidePassword = true.obs;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  String? imageUrl = "",
      email = "",
      firstName = "",
      id = "",
      idToken = "",
      password = "",
      name = "",
      lastName = "",
      photoUrl = "",
      provider = "";
  UserRepository? userRepository;
  String? googleName;

  AuthController() {
    userRepository = UserRepository();
  }

  void socialLogin() async {
    try {
      Map data = {
        "email": email ?? "",
        "username": name,
        "picture": imageUrl,
        "provider": provider,
      };
      loading.value = true;
      await userRepository!.socialLogin(data);
      loading.value = false;

      //Get.showSnackbar(Ui.successSnackBar(message: "Login Successfully"));
      await Get.offAllNamed(Routes.root);
    } catch (e) {
      loading.value = false;
      // Get.showSnackbar(Ui.errorSnackBar(message: e.toString()));
    } finally {
      loading.value = false;
    }
  }

  Future<String?> signInWithGoogle() async {
    loading.value = true;
    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount!.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );
    final UserCredential authResult =
        await _auth.signInWithCredential(credential);
    final User? user = authResult.user;

    if (user != null) {
      /* // Checking if email and name is null
      assert(user.email != null);
      assert(user.displayName != null);
      assert(user.photoURL != null);


      // Only taking the first part of the name, i.e., First Name*/
      googleName = user.displayName;
      if (googleName!.contains(" ")) {
        firstName = googleName!.substring(0, googleName!.indexOf(" "));
        lastName = googleName!.substring(0, googleName!.indexOf(" "));
      }
      /* assert(!user.isAnonymous);
      assert(await user.getIdToken() != null);

      final User? currentUser = _auth.currentUser;
      assert(user.uid == currentUser!.uid);
      */

      name = user.displayName;
      email = user.email;
      imageUrl = user.photoURL;
      id = user.uid;
      idToken = user.refreshToken;
      provider = "GOOGLE";

      socialLogin();
      return '$user';
    }

    return null;
  }

  Future<void> signOutGoogle() async {
    await googleSignIn.signOut();
  }

  Future<String?> signInWithFacebook() async {
    try {
      loading.value = true;
      final LoginResult result = await FacebookAuth.instance.login();
      if (result.accessToken != null) {
        final AuthCredential facebookCredential =
            FacebookAuthProvider.credential(result.accessToken!.token);
        final userCredential =
            await _auth.signInWithCredential(facebookCredential);
        Get.log(userCredential.toString());

        firstName = userCredential.user!.displayName;
        lastName = userCredential.user!.displayName;
        name = userCredential.user!.displayName;
        email = userCredential.user!.email;
        imageUrl = userCredential.user!.photoURL;
        id = userCredential.user!.uid;
        idToken = userCredential.user!.refreshToken;
        provider = "FACEBOOK";
        socialLogin();
      } else {
        loading.value = false;
      }
    } on FirebaseAuthException {
      loading.value = false;
      rethrow;
    }
    return null;
  }

  Future<void> fbLogout() async {
    await FacebookAuth.instance.logOut();
  }
}
