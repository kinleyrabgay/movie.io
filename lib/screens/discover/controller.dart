import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:movieio/common/models/user.model.dart';
import 'package:movieio/common/routes/routes.dart';
import 'package:movieio/common/store/user.dart';
import 'package:movieio/common/widgets/loaders.dart';
import 'package:movieio/screens/user/user.repository.dart';

class ExploreController extends GetxController {
  ExploreController();

  // --- USER CONTROLLER FUNCTIONS
  Rx<UserModel> user = UserModel.empty().obs;
  final userRepository = Get.put(UserRepository());
  final profileLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

  // Save user Record from any Registration Provider
  Future<void> saveUserRecord(UserCredential? userCredential) async {
    try {
      // Refresh user record
      await fetchUserRecord();
      profileLoading.value = true;
      if (user.value.id.isEmpty) {
        if (userCredential != null) {
          // Convert name first + last
          final namePorts =
              UserModel.namePorts(userCredential.user!.displayName ?? '');
          final username = UserModel.generateUsername(
              userCredential.user!.displayName ?? '');

          // Map Data
          final user = UserModel(
            id: userCredential.user!.uid,
            email: userCredential.user!.email ?? '',
            firstName: namePorts[0],
            lastName:
                namePorts.length > 1 ? namePorts.sublist(1).join(' ') : '',
            username: username,
            phoneNumber: userCredential.user!.phoneNumber ?? '',
            profilePicture: userCredential.user!.photoURL ?? '',
          );

          // Save user data
          await userRepository.saveUserRecord(user);
          profileLoading.value = false;
        }
      }
    } catch (e) {
      MVLoaders.warningSnackBar(
        title: 'Data not saved',
        message:
            'Something went wrong saving your information. You can re-sae your data in your profile',
      );
    }
  }

  Future<void> fetchUserRecord() async {
    print('Called!');
    try {
      final user = await userRepository.fetchUserDetails();
      this.user(user);
    } catch (e) {
      user(UserModel.empty());
    } finally {}
  }

  // [LogoutUser] - Logout
  Future<void> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      await UserStore.to.saveLogs(false);

      await Get.offAllNamed(AppRoutes.SIGN_IN);
    } on FirebaseAuthException catch (e) {
      throw 'Error $e.code';
    } on FirebaseException catch (e) {
      // throw TFirebaseException(e.code).message;
      throw 'Error $e';
    } on FormatException catch (_) {
      // throw const TFormatException();
      throw 'Error!';
    }
  }

  // --- EXPLORE CONTROLLER FUNCTIONS
}
