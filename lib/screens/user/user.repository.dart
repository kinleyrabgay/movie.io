import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:movieio/common/models/user.model.dart';
import 'package:movieio/common/repositories/authentication.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Function to save user data to Firestore
  Future<void> saveUserRecord(UserModel user) async {
    try {
      await _db.collection('Users').doc(user.id).set(user.toJson());
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  // Fetch user
  Future<UserModel> fetchUserDetails() async {
    try {
      final documentSnapShot = await _db
          .collection('Users')
          .doc(AuthenticationRepository.instance.authUser?.uid)
          .get();
      if (documentSnapShot.exists) {
        return UserModel.fromSnapShot(documentSnapShot);
      } else {
        return UserModel.empty();
      }
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }
}
