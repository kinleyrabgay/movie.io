import 'package:get/get.dart';
import 'package:movieio/screens/authentication/sign_in/controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
  }
}
