import 'package:movieio/common/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class MVChipTheme {
  MVChipTheme._();

  static ChipThemeData lightChipTheme = ChipThemeData(
    disabledColor: MVColors.grey.withOpacity(0.4),
    labelStyle: const TextStyle(color: MVColors.black),
    selectedColor: MVColors.black,
    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
    checkmarkColor: MVColors.white,
  );

  static ChipThemeData darkChipTheme = const ChipThemeData(
    disabledColor: MVColors.darkerGrey,
    labelStyle: TextStyle(color: MVColors.white),
    selectedColor: MVColors.black,
    padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
    checkmarkColor: MVColors.white,
  );
}
