import 'package:movieio/common/routes/routes.dart';
import 'package:get/get.dart';

import 'index.dart';

class WelcomeController extends GetxController {
  final state = WelcomeState();
  WelcomeController();
  final title = "Movieio .";

  @override
  void onReady() {
    super.onReady();
    Future.delayed(
      const Duration(seconds: 3),
      () => Get.offAllNamed(AppRoutes.EXPLORE),
    );
  }
}
