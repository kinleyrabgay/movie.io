import 'package:movieio/common/utils/constants/colors.dart';
import 'package:movieio/common/utils/helpers/functions.dart';
import 'package:flutter/material.dart';

class MVFormDivider extends StatelessWidget {
  const MVFormDivider({
    super.key,
    required this.divierText,
  });

  final String divierText;

  @override
  Widget build(BuildContext context) {
    final isDark = MVHelperFunctions.isDarkMode(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: Divider(
            color: isDark ? MVColors.darkGrey : MVColors.grey,
            thickness: 0.5,
            // indent: 60,
            endIndent: 5,
          ),
        ),
        Text(
          divierText,
          style: Theme.of(context).textTheme.labelMedium,
        ),
        Flexible(
          child: Divider(
            color: isDark ? MVColors.darkGrey : MVColors.grey,
            thickness: 0.5,
            indent: 5,
            // endIndent: 60,
          ),
        ),
      ],
    );
  }
}
