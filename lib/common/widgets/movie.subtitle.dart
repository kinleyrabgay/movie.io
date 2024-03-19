import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:movieio/common/utils/constants/colors.dart';
import 'package:movieio/common/utils/constants/enums.dart';
import 'package:movieio/common/utils/constants/sizes.dart';
import 'package:movieio/common/widgets/movie.subtitle.text.dart';

class MVSubtitle extends StatelessWidget {
  const MVSubtitle({
    super.key,
    required this.title,
    this.maxLines = 1,
    this.textColor,
    this.iconColor = MVColors.primary,
    this.textAlign = TextAlign.center,
    this.brandTextSize = TextSizes.small,
  });

  final String title;
  final int maxLines;
  final Color? textColor, iconColor;
  final TextAlign? textAlign;
  final TextSizes brandTextSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: MVSubtitleText(
            title: title,
            color: textColor,
            maxLines: maxLines,
            textAlign: textAlign,
            brandTextSize: brandTextSize,
          ),
        ),
        const SizedBox(width: MVSizes.xs),
        Icon(
          Iconsax.verify5,
          size: MVSizes.iconXs,
          color: iconColor,
        )
      ],
    );
  }
}
