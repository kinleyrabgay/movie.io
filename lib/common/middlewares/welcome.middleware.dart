// ignore_for_file: overridden_fields

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movieio/common/routes/names.dart';
import 'package:movieio/common/store/config.dart';
import 'package:movieio/common/store/user.dart';

class RouteWelcomeMiddleware extends GetMiddleware {
  @override
  int? priority = 0;

  RouteWelcomeMiddleware({required this.priority});

  @override
  RouteSettings? redirect(String? route) {
    print('ConfigStore ${ConfigStore.to.isFirstOpen}');
    if (ConfigStore.to.isFirstOpen == false) {
      return null;
    } else if (UserStore.to.isLogin == true) {
      return const RouteSettings(name: AppRoutes.HOME);
    } else {
      return const RouteSettings(name: AppRoutes.SIGN_IN);
    }
  }
}
