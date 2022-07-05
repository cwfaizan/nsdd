import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const Color kLightPrimaryColor = Color(0xFF8B010B);
const Color kLightAccentColor = Color(0xFFc50110);
const Color kLightTextColor = Color(0xff1F1A3D);
const Color kLightPlaceholderColor = Color(0xFFE8EAF0);
const Color kLightPlaceholderTextColor = Color(0xFFC6CAD3); //Color(0xffF5F6FA);
const Color kLightBackgroundColor = Color(0xFFD9D9D9);
const Color kLightErrorColor = Color(0xFFFF7971);

const Color kDarkPrimaryColor = Color(0xFFD9D9D9);
const Color kDarkAccentColor = Color(0xFFc50110);
const Color kDarkTextColor = Color(0xFFD9D9D9); //Color(0xff999999);
const Color kDarkPlaceholderColor = Color(0xFF7681a4);
const Color kDarkPlaceholderTextColor = Color(0xFF525C7C);
const Color kDarkBackgroundColor = Color(0xFF2D3251);
const Color kDarkErrorColor = Color(0xFFD0524A);

const Color kBlackColor = Colors.black;
const Color kWhiteColor = Colors.white;
const Color kGrayColor = Color(0xFF8D989D);

// Radius Circular
final kRadiusCircular = Radius.circular(10.r);
final kRadiusCircularHalf = Radius.circular(5.r);
final kBorderRadiusCircular = BorderRadius.circular(10.r);
final kBorderRadiusAll = BorderRadius.all(kRadiusCircular);
final kBorderRadiusAllHalf = BorderRadius.all(kRadiusCircularHalf);
final kBorderRadiusTop = BorderRadius.only(
  topLeft: kRadiusCircular,
  topRight: kRadiusCircular,
);
final kBorderRadiusBottom = BorderRadius.only(
  bottomLeft: kRadiusCircular,
  bottomRight: kRadiusCircular,
);
const kBorderSide = BorderSide(color: Colors.transparent, width: 0);

// border shape
// Input textfield decoration
final kOutlineInputBorderShape = OutlineInputBorder(
  borderRadius: kBorderRadiusCircular,
  borderSide: kBorderSide,
);
// border shape 2
// Card
final kRoundedRectangleBorderShape = RoundedRectangleBorder(
  borderRadius: kBorderRadiusAll,
  side: kBorderSide,
);
// border shape 3
const kCircleBorderShape = CircleBorder(side: kBorderSide);
// border shape 4
const kStadiumBorderShape = StadiumBorder(side: kBorderSide);

// Padding on Input textfield
final kContentPadding = EdgeInsets.symmetric(vertical: 20.h);

// Page Padding or Screen Padding
final kPagePadding = EdgeInsets.symmetric(horizontal: 20.w);
final kPageItemSpacing = SizedBox(height: 20.h);
final kPageItemSpacing2 = SizedBox(height: 40.h);
final kPageItemSpacingTop = SizedBox(height: 60.h);

// Padding on ElevatedButton
final kElevatedButtonPadding = EdgeInsets.symmetric(vertical: 18.h);

const kTextStyleWhiteBold = TextStyle(
  fontWeight: FontWeight.bold,
  color: kWhiteColor,
);

// const Duration kAnimationDuration = Duration(milliseconds: 300);
// const Curve kAnimationCurve = Curves.easeInOut;

// EdgeInsets kCardPadding = EdgeInsets.symmetric(
//   horizontal: 16.w,
//   vertical: 16.h,
// );

// EdgeInsets kInputFieldPadding = EdgeInsets.symmetric(
//   horizontal: 16.w,
//   vertical: 16.h,
// );

// BorderRadiusGeometry kCardBorderRadius = BorderRadius.circular(
//   16.r,
// );

// BorderRadius kAppIconBorderRadius = BorderRadius.circular(
//   8.r,
// );

// BorderRadiusGeometry kBottomSheetBorderRadius = BorderRadius.only(
//   topLeft: Radius.circular(16.r),
//   topRight: Radius.circular(16.r),
// );
