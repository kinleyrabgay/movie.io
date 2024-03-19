import 'package:flutter/material.dart';
import 'package:movieio/common/utils/constants/colors.dart';

class MVShadowStyle {
  static final verticalItemShadow = BoxShadow(
    color: MVColors.darkGrey.withOpacity(0.1),
    blurRadius: 50,
    spreadRadius: 7,
    offset: const Offset(0, 2),
  );

  static final horizontalItemShadow = BoxShadow(
    color: MVColors.darkGrey.withOpacity(0.1),
    blurRadius: 50,
    spreadRadius: 7,
    offset: const Offset(0, 2),
  );
}
