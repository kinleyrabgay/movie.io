import 'package:flutter/material.dart';
import 'package:movieio/common/utils/constants/colors.dart';
import 'package:movieio/common/utils/constants/sizes.dart';
import 'package:movieio/common/utils/helpers/functions.dart';


class MVCircularIcon extends StatelessWidget {
  const MVCircularIcon({
    super.key,
    this.witdh,
    this.height,
    this.size = MVSizes.lg,
    required this.icon,
    this.color,
    this.backgroundColor,
    this.onPressed,
  });

  final double? witdh, height, size;
  final IconData icon;
  final Color? color;
  final Color? backgroundColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: witdh,
      height: height,
      // alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: backgroundColor != null
            ? backgroundColor!
            : MVHelperFunctions.isDarkMode(context)
                ? MVColors.black.withOpacity(0.9)
                : MVColors.white.withOpacity(0.9),
      ),
      child: IconButton(
        onPressed: onPressed,
        padding: EdgeInsets.zero,
        icon: Icon(
          icon,
          color: color,
          size: size,
        ),
      ),
    );
  }
}
