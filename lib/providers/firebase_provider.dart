import 'package:firebase_auth/firebase_auth.dart' as fba;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseProvider extends GetxService {

  /*final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  String? name;
  String? email;
  String? imageUrl;*/
  Future<FirebaseProvider> init() async {
    intiliaze();
    return this;
  }

  Future intiliaze() async {
    await Firebase.initializeApp();

  }

/*  Future<String?> signInWithGoogle() async {
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
      // Checking if email and name is null
      assert(user.email != null);
      assert(user.displayName != null);
      assert(user.photoURL != null);

      name = user.displayName;
      email = user.email;
      imageUrl = user.photoURL;

      // Only taking the first part of the name, i.e., First Name
      if (name!.contains(" ")) {
        name = name!.substring(0, name!.indexOf(" "));
      }

      assert(!user.isAnonymous);
      assert(await user.getIdToken() != null);

      final User? currentUser = _auth.currentUser;
      assert(user.uid == currentUser!.uid);

      print('signInWithGoogle succeeded: $user');

      return '$user';
    }

    return null;
  }

  Future<void> signOutGoogle() async {
    await googleSignIn.signOut();

    print("User Signed Out");
  }

  Future<String?> signInWithFacebook() async {
    try {
      final LoginResult result = await FacebookAuth.instance.login();
      final AuthCredential facebookCredential =
          FacebookAuthProvider.credential(result.accessToken!.token);
      final userCredential =
          await _auth.signInWithCredential(facebookCredential);
      print(userCredential);
    } on FirebaseAuthException catch (e) {
      throw e;
    }
  }

  Future<void> fbLogout() async {
    await FacebookAuth.instance.logOut();
  }*/



  // fba.FirebaseAuth _auth = fba.FirebaseAuth.instance;

  // Future<FirebaseProvider> init() async {
  //   return this;
  // }

  // Future<bool> signInWithEmailAndPassword(String email, String password) async {
  //   try {
  //     fba.UserCredential result = await _auth.signInWithEmailAndPassword(
  //         email: email, password: password);
  //     if (result.user != null) {
  //       return true;
  //     } else {
  //       return false;
  //     }
  //   } catch (e) {
  //     return await signUpWithEmailAndPassword(email, password);
  //   }
  // }

  // Future<bool> signUpWithEmailAndPassword(String email, String password) async {
  //   fba.UserCredential result = await _auth.createUserWithEmailAndPassword(
  //       email: email, password: password);
  //   if (result.user != null) {
  //     return true;
  //   } else {
  //     return false;
  //   }
  // }

  // // Future<void> verifyPhone(String smsCode) async {
  // //   try {
  // //     final fba.AuthCredential credential = fba.PhoneAuthProvider.credential(
  // //         verificationId: Get.find<AuthService>().user.value.verificationId,
  // //         smsCode: smsCode);
  // //     await fba.FirebaseAuth.instance.signInWithCredential(credential);
  // //     Get.find<AuthService>().user.value.verifiedPhone = true;
  // //   } catch (e) {
  // //     Get.find<AuthService>().user.value.verifiedPhone = false;
  // //     throw Exception(e.toString());
  // //   }
  // // }

  // // Future<void> sendCodeToPhone() async {
  // //   Get.find<AuthService>().user.value.verificationId = '';
  // //   final fba.PhoneCodeAutoRetrievalTimeout autoRetrieve = (String verId) {};
  // //   final fba.PhoneCodeSent smsCodeSent =
  // //       (String verId, [int forceCodeResent]) {
  // //     Get.find<AuthService>().user.value.verificationId = verId;
  // //   };
  // //   final fba.PhoneVerificationCompleted _verifiedSuccess =
  // //       (fba.AuthCredential auth) async {};
  // //   final fba.PhoneVerificationFailed _verifyFailed =
  // //       (fba.FirebaseAuthException e) {
  // //     throw Exception(e.message);
  // //   };
  // //   await _auth.verifyPhoneNumber(
  // //     phoneNumber: Get.find<AuthService>().user.value.phoneNumber,
  // //     timeout: const Duration(seconds: 30),
  // //     verificationCompleted: _verifiedSuccess,
  // //     verificationFailed: _verifyFailed,
  // //     codeSent: smsCodeSent,
  // //     codeAutoRetrievalTimeout: autoRetrieve,
  // //   );
  // // }

  // Future signOut() async {
  //   return await _auth.signOut();
  // }
}
