import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movieio/common/entities/tmdb.movie.dart';

class MovieDetailScreen extends StatelessWidget {
  MovieDetailScreen({super.key});

  final Movie movie = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Text(movie.title),
    );
  }
}
