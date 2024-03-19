import 'package:get/get.dart';
import 'package:movieio/screens/discover/controller.dart';

class MovieDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ExploreController>(() => ExploreController());
  }
}
