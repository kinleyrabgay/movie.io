import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movieio/common/utils/constants/colors.dart';
import 'package:movieio/common/utils/helpers/functions.dart';
import 'package:movieio/common/widgets/animation.loader.dart';

class MVFullScreenLoader {
  static void openLoadingDialog(String text, String animation) {
    showDialog(
      context: Get.overlayContext!,
      barrierDismissible: false,
      builder: (_) => PopScope(
        child: Container(
          color: MVHelperFunctions.isDarkMode(Get.context!)
              ? MVColors.dark
              : MVColors.white,
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              const SizedBox(height: 250),
              MVAnimationLoader(text: text, animation: animation),
            ],
          ),
        ),
      ),
    );
  }

  static stopLoading() {
    Navigator.of(Get.overlayContext!).pop();
  }
}
