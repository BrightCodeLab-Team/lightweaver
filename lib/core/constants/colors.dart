import 'package:flutter/material.dart';

const Color primaryColor = Color(0xffEEA800);
const Color backGroundColor = Color(0xfffaf9f6);
const Color darkBlueColor = Color(0xff2683FF);
const Color darkPurpleColor = Color(0xff922EFF);
const Color redColor = Color(0xffEF4444);
const Color darkGreyColor = Color(0xff4B5563);
const Color borderColor = Color(0xffE9EAEB);
const Color lightGreyColor = Color(0xffABABAB);
const Color lightGreyColor2 = Color(0xff6B7280);
const Color mediumGreyColor = Color(0xff989898);
const Color hintTextColor = Color(0xffB3B3B3);
const Color pinFieldBorderColor = Color(0xffE1E1E1);
const Color greenColor = Color(0xff22C55E);
const Color lightRedColor = Color.fromRGBO(229, 204, 204, 1);
const Color blueColor = Color(0xff539BFF); // used in card
const Color whiteColor = Color(0xffffffff);
const Color transparentColor = Colors.transparent;
const Color blackColor = Colors.black;

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: primaryColor,
  scaffoldBackgroundColor: backGroundColor,
  appBarTheme: const AppBarTheme(
    backgroundColor: whiteColor,
    foregroundColor: blackColor,
    elevation: 0,
  ),
  textTheme: const TextTheme(bodyMedium: TextStyle(color: blackColor)),
  colorScheme: const ColorScheme.light(
    primary: primaryColor,
    secondary: darkBlueColor,
    error: redColor,
    background: backGroundColor,
  ),
);

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: darkPurpleColor,
  scaffoldBackgroundColor: darkGreyColor,
  appBarTheme: const AppBarTheme(
    backgroundColor: blackColor,
    foregroundColor: whiteColor,
    elevation: 0,
  ),
  textTheme: const TextTheme(bodyMedium: TextStyle(color: whiteColor)),
  colorScheme: const ColorScheme.dark(
    primary: darkPurpleColor,
    secondary: darkBlueColor,
    error: redColor,
    background: darkGreyColor,
  ),
);
