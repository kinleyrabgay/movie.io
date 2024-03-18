import 'package:flutter/material.dart';
import 'package:movieio/common/utils/constants/colors.dart';
import 'package:movieio/common/utils/theme/custom/app.bar.dart';
import 'package:movieio/common/utils/theme/custom/bottom.sheet.dart';
import 'package:movieio/common/utils/theme/custom/checkbox.dart';
import 'package:movieio/common/utils/theme/custom/chip.dart';
import 'package:movieio/common/utils/theme/custom/elevated.button.dart';
import 'package:movieio/common/utils/theme/custom/outlined.button.dart';
import 'package:movieio/common/utils/theme/custom/text.field.dart';
import 'package:movieio/common/utils/theme/custom/text.theme.dart';

class MVAppTheme {
  const MVAppTheme._();

  // Light Theme
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    textTheme: MVTextTheme.lightTextTheme,
    chipTheme: MVChipTheme.lightChipTheme,
    scaffoldBackgroundColor: MVColors.white,
    appBarTheme: MVAppBarTheme.lightAppBarTheme,
    checkboxTheme: MVCheckboxTheme.lightCheckboxTheme,
    bottomSheetTheme: MVBottomSheetTheme.lightBottomSheetTheme,
    elevatedButtonTheme: MVElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: MVOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: MVTextFieldTheme.lightInputDecorationTheme,
  );

  // Dark Theme
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    textTheme: MVTextTheme.darkTextTheme,
    chipTheme: MVChipTheme.darkChipTheme,
    scaffoldBackgroundColor: MVColors.dark,
    appBarTheme: MVAppBarTheme.darkAppBarTheme,
    bottomSheetTheme: MVBottomSheetTheme.darkBottomSheetTheme,
    checkboxTheme: MVCheckboxTheme.darkCheckboxTheme,
    elevatedButtonTheme: MVElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: MVOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: MVTextFieldTheme.darkInputDecorationTheme,
  );
}
