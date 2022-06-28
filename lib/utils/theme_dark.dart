import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'constants.dart';

final themeDataDark = ThemeData.dark().copyWith(
  primaryColor: kDarkPrimaryColor,
  scaffoldBackgroundColor: kDarkBackgroundColor,
  backgroundColor: kDarkPlaceholderColor,
  errorColor: kDarkErrorColor,
  textTheme: GoogleFonts.redHatDisplayTextTheme(
    const TextTheme().copyWith(
      headline1: TextStyle(
        fontSize: 48.sp,
        color: kDarkTextColor,
      ),
      headline2: TextStyle(
        fontSize: 32.sp,
        fontWeight: FontWeight.bold,
        color: kLightPrimaryColor,
      ),
      headline3: TextStyle(
        fontSize: 24.sp,
        color: kDarkTextColor,
        fontWeight: FontWeight.bold,
      ),
      headline4: TextStyle(
        fontSize: 24.sp,
        color: kDarkTextColor,
      ),
      headline5: TextStyle(
        fontSize: 20.sp,
        color: kDarkTextColor,
      ),
      headline6: TextStyle(
        fontSize: 16.sp,
        color: kDarkTextColor,
      ),
      bodyText1: TextStyle(
        fontSize: 12.sp,
        color: kDarkTextColor,
      ),
      bodyText2: TextStyle(
        fontSize: 14.sp,
        color: kDarkTextColor,
      ),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    border: kOutlineInputBorder,
    enabledBorder: kOutlineInputBorder,
    focusedBorder: kOutlineInputBorder,
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
      // side: BorderSide(color: borderColor),
      // backgroundColor: orangeColor,
      padding: EdgeInsets.symmetric(vertical: 17.h),
      textStyle: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
      ),
    ),
  ),
  // bottomNavigationBarTheme: BottomNavigationBarThemeData(
  //   backgroundColor: kDarkBackgroundColor,
  //   selectedItemColor: kDarkPrimaryColor,
  //   selectedIconTheme: IconThemeData(
  //     color: kDarkPrimaryColor,
  //     size: 24.sp,
  //   ),
  //   unselectedItemColor: kDarkPlaceholderTextColor,
  //   unselectedIconTheme: IconThemeData(
  //     color: kDarkPlaceholderTextColor,
  //     size: 24.sp,
  //   ),
  // ),
  // appBarTheme: AppBarTheme(
  //   backgroundColor: kDarkBackgroundColor,
  //   elevation: 0,
  //   systemOverlayStyle: SystemUiOverlayStyle.light,
  //   iconTheme: const IconThemeData(
  //     color: kDarkTextColor,
  //   ),
  //   titleTextStyle: TextStyle(
  //     fontSize: 16.sp,
  //     fontWeight: FontWeight.bold,
  //     color: kDarkTextColor,
  //   ),
  // ),
  progressIndicatorTheme: const ProgressIndicatorThemeData(
    refreshBackgroundColor: kDarkPlaceholderColor,
  ),
  colorScheme: const ColorScheme.dark().copyWith(
    background: kDarkPlaceholderColor,
    surface: kDarkPlaceholderTextColor,
    primary: kDarkPrimaryColor,
    secondary: kDarkAccentColor,
  ),
);
