import 'package:flutter/material.dart';
import 'package:lipid/presentation/theme/design_systems.dart';

class AlwaysActiveBorderSide extends MaterialStateBorderSide {
  @override
  // ignore: avoid_renaming_method_parameters
  BorderSide? resolve(_) => BorderSide(color: kGreyTwo);
}

ThemeData themeDark = ThemeData.dark();
ThemeData themeLight = ThemeData(
  fontFamily: "montserrat",
  primaryColor: kPrimaryColorOne,
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      primary: kPrimaryColorOne,
      textStyle: ktextMedium.copyWith(fontSize: 12, color: kPrimaryColorOne),
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(kPrimaryColorOne))),
  bottomSheetTheme:
      const BottomSheetThemeData(backgroundColor: Colors.transparent),
  radioTheme: RadioThemeData(
      fillColor: MaterialStateProperty.resolveWith((_) => kPrimaryColorOne)),
  appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(color: kPrimaryColorOne),
      backgroundColor: const Color(0xFFFFFFFF),
      elevation: 0.0,
      titleTextStyle: kLinkMedium.copyWith(color: kPrimaryColorTwo)),
  checkboxTheme: CheckboxThemeData(
    checkColor: MaterialStateProperty.resolveWith((_) => kPrimaryColorOne),
    fillColor: MaterialStateProperty.resolveWith((_) => Colors.transparent),
    materialTapTargetSize: MaterialTapTargetSize.padded,
    side: AlwaysActiveBorderSide(),
  ),
);
