// ignore_for_file: constant_identifier_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movieio/common/middlewares/auth.middleware.dart';
import 'package:movieio/common/routes/names.dart';
import 'package:movieio/common/routes/observers.dart';
import 'package:movieio/screens/authentication/sign_in/index.dart';
import 'package:movieio/screens/discover/index.dart';
import 'package:movieio/screens/details/index.dart';
import 'package:movieio/screens/trending/index.dart';

class AppPages {
  static const INITIAL = AppRoutes.INITIAL;
  static final RouteObserver<Route> observer = RouteObservers();
  static List<String> history = [];

  static final List<GetPage> routes = [
    GetPage(
        name: AppRoutes.INITIAL,
        page: () => const ExploreScreen(),
        binding: ExploreBinding(),
        middlewares: [RouteAuthMiddleware(priority: 1)]),
    GetPage(
        name: AppRoutes.SIGN_IN,
        page: () => const LoginScreen(),
        binding: LoginBinding()),
    GetPage(
        name: AppRoutes.TRENDING_NOW,
        page: () => const TrendingScreen(),
        binding: TrendingBinding()),
    GetPage(
        name: AppRoutes.MOVIE_DETAIL,
        page: () => MovieDetailScreen(),
        binding: MovieDetailBinding())
  ];
}
