import 'package:flutter/material.dart';
import 'package:movieio/common/utils/constants/colors.dart';

class MVOutlinedButtonTheme {
  MVOutlinedButtonTheme._();

  static final lightOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: MVColors.black,
      side: const BorderSide(color: MVColors.grey),
      textStyle: const TextStyle(
        fontSize: 16,
        color: Colors.black,
        fontWeight: FontWeight.w400,
      ),
      padding: const EdgeInsets.symmetric(vertical: 18),
      // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
    ),
  );

  static final darkOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: MVColors.white,
      side: const BorderSide(color: MVColors.grey),
      textStyle: const TextStyle(
        fontSize: 16,
        color: Colors.white,
        fontWeight: FontWeight.w400,
      ),
      padding: const EdgeInsets.symmetric(vertical: 18),
      // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
    ),
  );
}
