import 'package:flutter/material.dart';
import 'package:movieio/common/utils/constants/colors.dart';

class MVTextFieldTheme {
  MVTextFieldTheme._();

  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: MVColors.grey,
    suffixIconColor: MVColors.darkGrey,
    // constraints: const BoxConstraints.expand(height: 200),
    labelStyle: const TextStyle().copyWith(fontSize: 14, color: MVColors.grey),
    hintStyle: const TextStyle().copyWith(fontSize: 14, color: MVColors.grey),
    errorStyle:
        const TextStyle().copyWith(fontSize: 12, fontStyle: FontStyle.normal),
    contentPadding:
        const EdgeInsets.symmetric(vertical: 18.0, horizontal: 12.0),
    floatingLabelStyle: const TextStyle().copyWith(
      color: Colors.black.withOpacity(0.8),
    ),
    border: const OutlineInputBorder().copyWith(
      // borderRadius: BorderRadius.circular(14),
      borderRadius: BorderRadius.zero,
      borderSide: const BorderSide(width: 1, color: MVColors.grey),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      // borderRadius: BorderRadius.circular(14),
      borderRadius: BorderRadius.zero,
      borderSide: const BorderSide(width: 1, color: MVColors.grey),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      // borderRadius: BorderRadius.circular(14),
      borderRadius: BorderRadius.zero,
      borderSide: const BorderSide(width: 1, color: Colors.black12),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      // borderRadius: BorderRadius.circular(14),
      borderRadius: BorderRadius.zero,
      borderSide: const BorderSide(width: 1, color: Colors.red),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      // borderRadius: BorderRadius.circular(14),
      borderRadius: BorderRadius.zero,
      borderSide: const BorderSide(width: 1, color: Colors.orange),
    ),
  );

  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: MVColors.grey,
    suffixIconColor: MVColors.grey,
    // constraints: const BoxConstraints.expand(height: 14)
    labelStyle: const TextStyle().copyWith(fontSize: 14, color: Colors.white),
    hintStyle: const TextStyle().copyWith(fontSize: 14, color: Colors.white),
    errorStyle:
        const TextStyle().copyWith(fontSize: 12, fontStyle: FontStyle.normal),
    contentPadding:
        const EdgeInsets.symmetric(vertical: 18.0, horizontal: 12.0),
    floatingLabelStyle: const TextStyle().copyWith(
      color: Colors.white.withOpacity(0.8),
    ),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(width: 1, color: MVColors.grey),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(width: 1, color: MVColors.grey),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(width: 1, color: Colors.white),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(width: 1, color: Colors.red),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(width: 1, color: Colors.orange),
    ),
  );
}
