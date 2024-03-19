import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:movieio/common/configs/internet.dart';
import 'package:movieio/common/repositories/authentication.dart';
import 'package:movieio/common/routes/names.dart';
import 'package:movieio/common/store/user.dart';
import 'package:movieio/common/widgets/loaders.dart';
import 'package:movieio/screens/discover/controller.dart';

class LoginController extends GetxController {
  LoginController();

  // --- Email
  final hidePassword = false.obs;
  final rememberMe = false.obs;
  final disableButton = true.obs;
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  // --- User
  final userController = Get.put(ExploreController());

  // ----- Storage -------
  final localStorage = GetStorage();

  // ----- Init --------
  @override
  void onInit() {
    FlutterNativeSplash.remove();
    // ---- Read storage for (E & P)
    email.text = localStorage.read('REMEMBER_ME_EMAIL') ?? '';
    password.text = localStorage.read('REMEMBER_ME_PASSWORD') ?? '';
    super.onInit();
  }

  Future<void> redirectAuthScreen() async {
    //--- Email exist ? redirect to login else to register
    // Get.offAllNamed(AppRoutes.register);
  }

  // ----- Google Login ------------------
  Future<void> googleSignIn() async {
    // Check internet
    final isConnected = await NetworkManager.instance.isConnected();
    if (!isConnected) {
      MVLoaders.warningSnackBar(
          title: 'Oh snap!',
          message: 'Please connect to ineternet and try again.');
      return;
    }
    // Google Authentication
    final userCredentials =
        await AuthenticationRepository.instance.googleSignIn();

    EasyLoading.show(
        indicator: const CircularProgressIndicator(),
        maskType: EasyLoadingMaskType.clear,
        dismissOnTap: true);

    // Save user records
    await userController.saveUserRecord(userCredentials);
    asyncPostAllData(userCredentials);
  }

  // ----- Facebook Login ------------------
  Future<UserCredential> facebookSignIn() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);

    // Once signed in, return the UserCredential
    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }

  // handleSignIn(String type) async {
  //   // type 1; email, 2: google, 3: facebook
  //   try {
  //     if(type == 'email') {} else if(type == 'google') {
  //       var user = await _googleSi
  //     }
  //   } catch (e) {}
  // }

  asyncPostAllData(UserCredential? user) async {
    if (user != null) {
      await UserStore.to.saveLogs(true);
      Get.offAllNamed(AppRoutes.EXPLORE);
    } else {
      MVLoaders.errorSnackBar(title: 'Oh snap! Try again!');
    }
    EasyLoading.dismiss();
  }
}
