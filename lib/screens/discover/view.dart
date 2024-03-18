import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:iconsax/iconsax.dart';
import 'package:movieio/common/utils/constants/colors.dart';
import 'package:movieio/common/utils/constants/image.dart';
import 'package:movieio/common/utils/constants/sizes.dart';
import 'package:movieio/common/widgets/circular.image.dart';
import 'package:movieio/common/widgets/shimmer.effect.dart';
import 'package:movieio/screens/discover/controller.dart';

class ExploreScreen extends GetView<ExploreController> {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                        Icon(
                          Iconsax.user,
                          size: 20,
                        ),
                        SizedBox(width: 10),
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(MVSizes.defaultSpace),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // --- App Name
                    Container(
                      child: const Text('Movie.io'),
                    ),
                    // --- Profile
                    Obx(() {
                      final networkImage = controller.user.value.profilePicture;
                      final image = networkImage.isNotEmpty
                          ? networkImage
                          : MVImageString.facebook;
                      return controller.profileLoading.value
                          ? const MVShimmerEffect(width: 40, height: 40)
                          : MVCircularImage(
                              image: image,
                              isNetworkImage: networkImage.isNotEmpty,
                              width: 40,
                              height: 40,
                              border: 40,
                            );
                    }),
                  ],
                ),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () => controller.logout(),
                    child: const Text('Logout'),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () => controller.fetchUserRecord(),
                    child: Obx(() => Text(controller.user.value.email)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
