import 'package:flutter/material.dart';
import 'package:movieio/common/utils/constants/colors.dart';
import 'package:movieio/common/utils/helpers/functions.dart';
import 'package:shimmer/shimmer.dart';

class MVShimmerEffect extends StatelessWidget {
  const MVShimmerEffect({
    super.key,
    required this.width,
    required this.height,
    this.radius = 15,
    this.color,
  });

  final double width, height, radius;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final dark = MVHelperFunctions.isDarkMode(context);
    return Shimmer.fromColors(
      baseColor: dark ? Colors.grey[850]! : Colors.grey[300]!,
      highlightColor: dark ? Colors.grey[700]! : Colors.grey[100]!,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color ?? (dark ? MVColors.darkerGrey : MVColors.white),
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
    );
  }
}
