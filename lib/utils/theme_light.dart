import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'constants.dart';

final themeDataLight = ThemeData.light().copyWith(
  primaryColor: kLightPrimaryColor,
  scaffoldBackgroundColor: kLightBackgroundColor,
  backgroundColor: kLightPlaceholderColor,
  errorColor: kLightErrorColor,
  textTheme: GoogleFonts.redHatDisplayTextTheme(
    const TextTheme().copyWith(
      // headline1: TextStyle(
      //   fontSize: 48.sp,
      //   fontWeight: FontWeight.bold,
      //   color: kLightPrimaryColor,
      // ),
      // headline2: TextStyle(
      //   fontSize: 32.sp,
      //   fontWeight: FontWeight.bold,
      //   color: kLightPrimaryColor,
      // ),
      headline3: TextStyle(
        fontSize: 24.sp,
        fontWeight: FontWeight.bold,
        color: kLightPrimaryColor,
      ),
      // headline4: TextStyle(
      //   fontSize: 20.sp,
      //   fontWeight: FontWeight.bold,
      //   color: kWhiteColor,
      // ),
      // headline5: TextStyle(
      //   fontSize: 18.sp,
      //   color: kLightTextColor,
      // ),
      headline6: TextStyle(
        fontSize: 16.sp,
        color: kLightTextColor,
      ),
      bodyText1: TextStyle(
        fontSize: 14.sp,
        color: kLightTextColor,
      ),
      bodyText2: TextStyle(
        fontSize: 12.sp,
        color: kLightTextColor,
      ),
      button: TextStyle(
        fontSize: 17.sp,
        fontWeight: FontWeight.bold,
      ),
      subtitle1: const TextStyle(
        color: kLightPrimaryColor,
      ),
    ),
  ),
  iconTheme: IconThemeData(
    color: kLightPrimaryColor,
    size: 30.w,
  ),
  inputDecorationTheme: InputDecorationTheme(
    border: kOutlineInputBorderShape,
    enabledBorder: kOutlineInputBorderShape,
    focusedBorder: kOutlineInputBorderShape,
    filled: true,
    fillColor: kLightPlaceholderColor,
    contentPadding: kContentPadding,
    hintStyle: TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w500,
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      padding: kElevatedButtonPadding,
      textStyle: const TextStyle(
        fontWeight: FontWeight.w600,
      ),
    ),
  ),
  appBarTheme: const AppBarTheme(
    // systemOverlayStyle: SystemUiOverlayStyle.light,
    // backgroundColor: kLightPrimaryColor,
    elevation: 0,
    // titleTextStyle: TextStyle(
    //   fontSize: 14.sp,
    //   fontWeight: FontWeight.bold,
    //   color: kDarkTextColor,
    // ),
  ),
  // bottomNavigationBarTheme: BottomNavigationBarThemeData(
  //   backgroundColor: kLightBackgroundColor,
  //   selectedItemColor: kLightPrimaryColor,
  //   selectedIconTheme: IconThemeData(
  //     color: kLightPrimaryColor,
  //     size: 24.sp,
  //   ),
  //   unselectedItemColor: kLightPlaceholderTextColor,
  //   unselectedIconTheme: IconThemeData(
  //     color: kLightPlaceholderTextColor,
  //     size: 24.sp,
  //   ),
  // ),
  // progressIndicatorTheme: const ProgressIndicatorThemeData(
  //   refreshBackgroundColor: kLightPlaceholderColor,
  // ),
  colorScheme: const ColorScheme.light().copyWith(
    background: kLightPlaceholderColor,
    surface: kLightPlaceholderTextColor,
    primary: kLightPrimaryColor,
    secondary: kLightAccentColor,
  ),
);
