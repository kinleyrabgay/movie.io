import 'package:get/get.dart';
import 'package:movieio/screens/discover/controller.dart';

class ExploreBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ExploreController>(() => ExploreController());
  }
}
