import 'package:get/get.dart';
import 'package:movieio/screens/discover/controller.dart';

class TrendingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ExploreController>(() => ExploreController());
  }
}
