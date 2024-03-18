import 'package:flutter/material.dart';
import 'package:movieio/common/utils/constants/colors.dart';

class MVIconImage extends StatelessWidget {
  const MVIconImage({
    super.key,
    required this.image,
    this.index,
    this.isSelected = false,
  });

  final String image;
  final int? index;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      image,
      height: 25,
      width: 25,
      color:
          isSelected ? MVColors.primary : MVColors.darkerGrey.withOpacity(0.4),
    );
  }
}
