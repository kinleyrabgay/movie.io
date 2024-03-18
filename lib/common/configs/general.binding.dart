import 'package:get/get.dart';
import 'package:movieio/common/configs/internet.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(NetworkManager());
  }
}
