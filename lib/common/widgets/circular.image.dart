import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movieio/common/utils/constants/colors.dart';
import 'package:movieio/common/utils/constants/sizes.dart';
import 'package:movieio/common/utils/helpers/functions.dart';
import 'package:movieio/common/widgets/shimmer.effect.dart';

class MVCircularImage extends StatelessWidget {
  const MVCircularImage({
    super.key,
    this.fit = BoxFit.cover,
    required this.image,
    this.isNetworkImage = false,
    this.overlayColor,
    this.backgroundColor,
    this.width = 80,
    this.height = 80,
    this.padding = MVSizes.sm,
    this.border = 80,
  });

  final BoxFit? fit;
  final String image;
  final bool isNetworkImage;
  final Color? overlayColor;
  final Color? backgroundColor;
  final double border;
  final double width, height, padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: const EdgeInsets.all(MVSizes.sm),
      decoration: BoxDecoration(
        color: MVHelperFunctions.isDarkMode(context)
            ? MVColors.black
            : MVColors.white,
        borderRadius: BorderRadius.circular(border),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(80),
        child: Center(
          child: isNetworkImage
              ? CachedNetworkImage(
                  imageUrl: image,
                  fit: fit,
                  color: overlayColor,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      const MVShimmerEffect(width: 80, height: 80, radius: 80),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                )
              : Image(
                  fit: fit,
                  image: isNetworkImage
                      ? NetworkImage(image)
                      : AssetImage(image) as ImageProvider,
                  color: overlayColor,
                ),
        ),
      ),
    );
  }
}
