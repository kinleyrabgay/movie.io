import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movieio/common/api/api.config.dart';
import 'package:movieio/common/entities/tmdb.movie.dart';
import 'package:movieio/common/routes/routes.dart';
import 'package:movieio/common/utils/constants/colors.dart';
import 'package:movieio/common/utils/constants/sizes.dart';
import 'package:movieio/common/utils/helpers/functions.dart';
import 'package:movieio/common/widgets/icon.circular.dart';
import 'package:movieio/common/widgets/movie.subtitle.dart';
import 'package:movieio/common/widgets/movie.title.dart';
import 'package:movieio/common/widgets/rounded.container.dart';
import 'package:movieio/common/widgets/rounded.image.dart';
import 'package:movieio/common/widgets/shadow.style.dart';
import 'package:movieio/common/widgets/shimmer.effect.dart';
import 'package:movieio/screens/discover/index.dart';

class MVCardVertical extends GetView<ExploreController> {
  const MVCardVertical({super.key, required this.movie});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    final dark = MVHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () => Get.toNamed(AppRoutes.MOVIE_DETAIL, arguments: movie),
      child: Container(
        padding: const EdgeInsets.all(0),
        decoration: BoxDecoration(
          boxShadow: [MVShadowStyle.verticalItemShadow],
          borderRadius: BorderRadius.circular(MVSizes.productImageRadius),
          color: dark ? MVColors.darkerGrey : MVColors.white,
        ),
        child: Column(
          children: [
            MVRoundedContainer(
              height: 150,
              backgroundColor: dark ? MVColors.dark : MVColors.light,
              child: Stack(
                children: [
                  // Thumbnail
                  Obx(() {
                    return controller.loading.value
                        ? MVShimmerEffect(
                            width: MediaQuery.of(context).size.width * 1.0,
                            height: MediaQuery.of(context).size.height * 1.0)
                        : MVRoundedImage(
                            width: MediaQuery.of(context).size.width * 1.0,
                            height: MediaQuery.of(context).size.height * 1.0,
                            imageUrl:
                                ApiConfig.imageBaseUrl + movie.backdropPath,
                            applyImageRadius: true,
                            fit: BoxFit.cover,
                            isNetworkImage: true,
                          );
                  }),

                  // Sale Tag
                  Positioned(
                    top: 8,
                    left: 4,
                    child: MVRoundedContainer(
                      radius: MVSizes.sm,
                      backgroundColor: MVColors.secondary.withOpacity(0.8),
                      padding: const EdgeInsets.symmetric(
                        horizontal: MVSizes.sm,
                        vertical: MVSizes.xs,
                      ),
                      child: Text(
                        '25 %',
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .apply(color: MVColors.black),
                      ),
                    ),
                  ),

                  //
                  const Positioned(
                    top: 4,
                    right: 4,
                    child: MVCircularIcon(
                      icon: CupertinoIcons.heart_fill,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: MVSizes.spaceBtwItems / 2),
            Padding(
              padding: EdgeInsets.only(left: MVSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MVTitle(
                    title: movie.title,
                    smallSize: true,
                  ),
                  SizedBox(height: MVSizes.spaceBtwItems / 2),
                  MVSubtitle(title: 'Nike')
                  // const SizedBox(height: MVSizes.spaceBtwItems / 2),
                ],
              ),
            ),
            // const Spacer(),
            // Padding(
            //   padding: const EdgeInsets.only(left: MVSizes.sm),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       // Price
            //       const TProductPriceText(
            //         currencySign: '\$',
            //         price: '35',
            //         maxLines: 1,
            //         isLarge: true,
            //         lineThrough: false,
            //       ),
            //       Container(
            //         decoration: const BoxDecoration(
            //           color: MVColors.dark,
            //           borderRadius: BorderRadius.only(
            //             topLeft: Radius.circular(MVSizes.cardRadiusMd),
            //             bottomRight:
            //                 Radius.circular(MVSizes.productImageRadius),
            //           ),
            //         ),
            //         child: const SizedBox(
            //           width: MVSizes.iconLg * 1.2,
            //           height: MVSizes.iconLg * 1.2,
            //           child: Icon(
            //             Icons.add,
            //             color: Colors.white,
            //           ),
            //         ),
            //       )
            //     ],
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
