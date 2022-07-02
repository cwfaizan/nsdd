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
      // headline1: TextStyle(
      //   fontSize: 48.sp,
      //   color: kDarkTextColor,
      // ),
      // headline2: TextStyle(
      //   fontSize: 32.sp,
      //   fontWeight: FontWeight.bold,
      //   color: kDarkTextColor,
      // ),
      headline3: TextStyle(
        fontSize: 24.sp,
        fontWeight: FontWeight.bold,
        color: kDarkTextColor,
      ),

      // headline4: TextStyle(
      //   fontSize: 24.sp,
      //   color: kDarkTextColor,
      // ),
      // headline5: TextStyle(
      //   fontSize: 20.sp,
      //   color: kDarkTextColor,
      // ),
      headline6: TextStyle(
        fontSize: 16.sp,
        color: kDarkTextColor,
      ),
      bodyText1: TextStyle(
        fontSize: 14.sp,
        color: kDarkTextColor,
      ),
      // bodyText2: TextStyle(
      //   fontSize: 12.sp,
      //   color: kDarkTextColor,
      // ),
      button: TextStyle(
        fontSize: 17.sp,
        fontWeight: FontWeight.bold,
        color: kBlackColor,
      ),
      subtitle1: const TextStyle(
        color: kDarkTextColor,
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
    fillColor: kDarkPlaceholderColor,
    contentPadding: kContentPadding,
    hintStyle: TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w500,
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      primary: kDarkPrimaryColor,
      padding: kElevatedButtonPadding,
      textStyle: const TextStyle(
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
  // progressIndicatorTheme: const ProgressIndicatorThemeData(
  //   refreshBackgroundColor: kDarkPlaceholderColor,
  // ),
  colorScheme: const ColorScheme.dark().copyWith(
    background: kDarkPlaceholderColor,
    surface: kDarkPlaceholderTextColor,
    primary: kDarkPrimaryColor,
    secondary: kDarkAccentColor,
  ),
);
