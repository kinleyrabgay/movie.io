import 'package:movieio/common/utils/constants/colors.dart';
import 'package:movieio/common/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class MVHeaderText extends StatelessWidget {
  const MVHeaderText({
    super.key,
    required this.title,
    required this.subTitle,
  });

  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(height: MVSizes.sm),
        Text(
          subTitle,
          style: Theme.of(context)
              .textTheme
              .bodySmall!
              .apply(color: MVColors.darkGrey),
        ),
      ],
    );
  }
}
