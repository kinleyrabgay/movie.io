import 'package:flutter/material.dart';
import 'package:movieio/common/utils/constants/colors.dart';
import 'package:movieio/common/utils/constants/sizes.dart';


class MVRoundedContainer extends StatelessWidget {
  const MVRoundedContainer({
    super.key,
    this.width,
    this.height,
    this.radius = MVSizes.cardRadiusLg,
    this.child,
    this.showBorder = false,
    this.borderColor = MVColors.borderPrimary,
    this.backgroundColor = MVColors.white,
    this.padding,
    this.margin,
  });

  final double? width;
  final double? height;
  final double radius;
  final Widget? child;
  final bool showBorder;
  final Color borderColor;
  final Color backgroundColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(radius),
        border: showBorder ? Border.all(color: borderColor) : null,
      ),
      child: child,
    );
  }
}
