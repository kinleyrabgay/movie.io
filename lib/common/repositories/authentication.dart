import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  // --- Variable
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  // --- Authenticated user data
  User? get authUser => _auth.currentUser;

  // --- Called from main.dart on app launch
  @override
  void onReady() {}

  // Function to show relevant screen
  // screenRedirect() async {
  //   final user = _auth.currentUser;
  //   if (user != null) {
  //     if (user.emailVerified) {
  //       Get.offAll(() => const NavigationMenu());
  //     } else {
  //       Get.offAll(() => VerifyEmailScreen(email: _auth.currentUser?.email));
  //     }
  //   } else {
  //     if (kDebugMode) {
  //       print("============ GET STOREAGE ===============");
  //       print(deviceStorage.read('isFirstTime'));
  //     }

  //     deviceStorage.writeIfNull('isFirstTime', true);
  //     deviceStorage.read('isFirstTime') != true
  //         ? Get.offAll(() => const LoginScreen())
  //         : Get.offAll(() => const OnBoardingScreen());
  //   }
  //   // Local Storage
  // }

  // --- Google Authentication
  Future<UserCredential?> googleSignIn() async {
    try {
      final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await userAccount?.authentication;

      final credentials = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      return await _auth.signInWithCredential(credentials);
    } catch (e) {
      if (kDebugMode) print('Something went wrong: $e');
      return null;
    }
  }
}
