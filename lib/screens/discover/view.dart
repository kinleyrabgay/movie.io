import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:iconsax/iconsax.dart';
import 'package:movieio/common/routes/routes.dart';
import 'package:movieio/common/utils/constants/colors.dart';
import 'package:movieio/common/utils/constants/sizes.dart';
import 'package:movieio/common/utils/helpers/functions.dart';
import 'package:movieio/common/widgets/grid.layout.dart';
import 'package:movieio/common/widgets/movie.vertical.card.dart';
import 'package:movieio/common/widgets/section.heading.dart';
import 'package:movieio/common/widgets/slider.dart';
import 'package:movieio/screens/discover/controller.dart';

class ExploreScreen extends GetView<ExploreController> {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = MVHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie .io'),
        actions: [
          // Obx(() {
          //   final networkImage = controller.user.value.profilePicture;
          //   final image =
          //       networkImage.isNotEmpty ? networkImage : MVImageString.facebook;
          //   return controller.profileLoading.value
          //       ? const MVShimmerEffect(
          //           width: 60,
          //           height: 60,
          //           radius: 60,
          //         )
          //       : MVCircularImage(
          //           image: image,
          //           isNetworkImage: networkImage.isNotEmpty,
          //           width: 60,
          //           height: 60,
          //           border: 60,
          //         );
          // }),
          PopupMenuButton<int>(
            itemBuilder: (context) => [
              // popupmenu item 1
              PopupMenuItem(
                value: 1,
                child: Material(
                  child: InkWell(
                    onTap: () {},
                    child: Row(
                      children: [
                        const Icon(
                          Iconsax.user,
                          size: 20,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          "Profile",
                          style:
                              Theme.of(context).textTheme.bodyMedium!.apply(),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              // popupmenu item 2
              PopupMenuItem(
                value: 2,
                child: Material(
                  // color: MVColors.white,
                  child: InkWell(
                    onTap: () => controller.logout(),
                    child: const Row(
                      children: [
                        Icon(Iconsax.logout),
                        SizedBox(width: 10),
                        Text("Logout")
                      ],
                    ),
                  ),
                ),
              ),
            ],
            offset: const Offset(-15, 30),
            color: MVColors.white,
            elevation: 0.5,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: MVSizes.defaultSpace,
              vertical: MVSizes.defaultSpace / 4,
            ),
            child: Column(
              children: [
                // --- Slider
                MVSlider(dark: dark),
                const SizedBox(height: MVSizes.spaceBtwSections),

                // --- Trending
                Column(
                  children: [
                    MVSectionHeading(
                      showActionButton: true,
                      title: 'Trending Now',
                      onPressed: () => Get.toNamed(AppRoutes.TRENDING_NOW),
                    ),
                    Obx(
                      () => MVGridLayout(
                        itemCount: controller.trendingNowMoviews.length,
                        mainAxisExtent: 260,
                        itemBuilder: (_, index) {
                          return MVCardVertical(
                            movie: controller.trendingNowMoviews[index],
                          );
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: MVSizes.spaceBtwSections),

                // --- Popular
                Column(
                  children: [
                    MVSectionHeading(
                      showActionButton: true,
                      title: 'Popular',
                      onPressed: () => Get.toNamed(AppRoutes.TRENDING_NOW),
                    ),
                    Obx(
                      () => MVGridLayout(
                        itemCount: controller.trendingNowMoviews.length,
                        mainAxisExtent: 260,
                        itemBuilder: (_, index) {
                          return MVCardVertical(
                            movie: controller.trendingNowMoviews[index],
                          );
                        },
                      ),
                    ),
                  ],
                )
              ],
            )),
      ),
    );
  }
}
