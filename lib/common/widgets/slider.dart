import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movieio/common/api/api.config.dart';
import 'package:movieio/common/routes/routes.dart';
import 'package:movieio/common/utils/constants/colors.dart';
import 'package:movieio/common/utils/constants/sizes.dart';
import 'package:movieio/common/widgets/rounded.container.dart';
import 'package:movieio/common/widgets/rounded.image.dart';
import 'package:movieio/screens/discover/index.dart';

class MVSlider extends GetView<ExploreController> {
  const MVSlider({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => CarouselSlider(
        options: CarouselOptions(
          height: 200.0,
          autoPlay: true,
          aspectRatio: 1.5,
          viewportFraction: 0.9,
          enlargeStrategy: CenterPageEnlargeStrategy.height,
          enlargeCenterPage: true,
        ),
        items: controller.mainTopRatedMovies.map((movie) {
          return Builder(
            builder: (BuildContext context) {
              return GestureDetector(
                onTap: () => Get.toNamed(
                  AppRoutes.MOVIE_DETAIL,
                  arguments: movie,
                ),
                child: MVRoundedContainer(
                  backgroundColor: dark ? MVColors.dark : MVColors.light,
                  child: MVRoundedImage(
                    imageUrl: ApiConfig.imageBaseUrl + movie.backdropPath,
                    isNetworkImage: true,
                    fit: BoxFit.fill,
                    applyImageRadius: true,
                  ),
                ),
              );
            },
          );
        }).toList(),
      ),
    );
  }
}
