// ignore_for_file: overridden_fields
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:movieio/common/routes/names.dart';
import 'package:movieio/common/store/user.dart';

class RouteAuthMiddleware extends GetMiddleware {
  @override
  int? priority = 0;

  RouteAuthMiddleware({required this.priority});

  @override
  RouteSettings? redirect(String? route) {
    print(UserStore.to.isLogin);
    if (UserStore.to.isLogin || route == AppRoutes.SIGN_IN) {
      return null;
    } else {
      Future.delayed(
        const Duration(seconds: 2),
        () => Get.snackbar('Tips', 'Login expired, please login again!'),
      );
      return const RouteSettings(name: AppRoutes.SIGN_IN);
    }
  }
}
