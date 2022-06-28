import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const Color kLightPrimaryColor = Color(0xFF8B010B);
const Color kLightAccentColor = Color(0xFFc50110);
const Color kLightTextColor = Colors.black;
const Color kLightPlaceholderColor = Color(0xFFE8EAF0);
const Color kLightPlaceholderTextColor = Color(0xFFC6CAD3);
const Color kLightBackgroundColor = Color(0xFFFFFFFF);
const Color kLightErrorColor = Color(0xFFFF7971);

const Color kDarkPrimaryColor = Color(0xFF8B010B);
const Color kDarkAccentColor = Color(0xFFc50110);
const Color kDarkTextColor = Colors.white;
const Color kDarkPlaceholderColor = Color(0xFF2D3655);
const Color kDarkPlaceholderTextColor = Color(0xFF525C7C);
const Color kDarkBackgroundColor = Color(0xFF2D3251);
const Color kDarkErrorColor = Color(0xFFD0524A);

const Duration kAnimationDuration = Duration(milliseconds: 300);
const Curve kAnimationCurve = Curves.easeInOut;

// Input textfield decoration
final kOutlineInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(10.r),
  borderSide: const BorderSide(color: Colors.transparent, width: 0),
);
final kContentPadding = EdgeInsets.symmetric(vertical: 20.h);

EdgeInsets kPagePadding = EdgeInsets.symmetric(
  horizontal: 16.w,
);

EdgeInsets kCardPadding = EdgeInsets.symmetric(
  horizontal: 16.w,
  vertical: 16.h,
);

EdgeInsets kInputFieldPadding = EdgeInsets.symmetric(
  horizontal: 16.w,
  vertical: 16.h,
);

BorderRadiusGeometry kCardBorderRadius = BorderRadius.circular(
  16.r,
);

BorderRadius kAppIconBorderRadius = BorderRadius.circular(
  8.r,
);

BorderRadiusGeometry kBottomSheetBorderRadius = BorderRadius.only(
  topLeft: Radius.circular(16.r),
  topRight: Radius.circular(16.r),
);
