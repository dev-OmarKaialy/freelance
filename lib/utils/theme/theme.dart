
import 'package:flutter/material.dart';
import 'package:project1company/utils/theme/custom_themes/appbar_theme.dart';
import 'package:project1company/utils/theme/custom_themes/buttom_sheet_theme.dart';
import 'package:project1company/utils/theme/custom_themes/checkbox_theme.dart';
import 'package:project1company/utils/theme/custom_themes/chip_theme.dart';
import 'package:project1company/utils/theme/custom_themes/elevated_button_theme.dart';
import 'package:project1company/utils/theme/custom_themes/outlined_button_theme.dart';
import 'package:project1company/utils/theme/custom_themes/text_field_theme.dart';

import 'custom_themes/custom_theme.dart';

class TAppTheme {
  TAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    textTheme: TTextTheme.lightTextTheme,
    chipTheme: TChipTheme.lightChipTheme,
    appBarTheme: TAppBarTheme.LightAppBarTheme,
    checkboxTheme: TCheckboxTheme.lightCheckboxTheme,
    bottomSheetTheme: TBottomSheetTheme.lightBottomSheetTheme,
    elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.LightOutLinedButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.lightInputDecorationTheme,
    hintColor: Colors.blueAccent,



  );

  static ThemeData darkMode = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.black,
    textTheme: TTextTheme.darkTextTheme,
    chipTheme: TChipTheme.darkChipTheme,
    appBarTheme: TAppBarTheme.darkAppBarTheme,
    checkboxTheme: TCheckboxTheme.darkCheckboxTheme,
    bottomSheetTheme: TBottomSheetTheme.darkBottomSheetTheme,
    elevatedButtonTheme: TElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.darkInputDecorationTheme,
    hintColor: Colors.deepOrangeAccent,


  );
}



class TTextTheme {
  static final lightTextTheme = TextTheme(
    bodyMedium: TextStyle(color: Colors.black),

  );

  static final darkTextTheme = TextTheme(
    bodyMedium: TextStyle(color: Colors.white),

  );
}

