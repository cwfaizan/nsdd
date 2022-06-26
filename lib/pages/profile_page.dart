import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final orangeColor = const Color(0xffFCC50A);
  final blackColor = const Color(0xff000000);
  final purpleColor = const Color(0xff6688FF);

  final darkTextColor = const Color(0xff1F1A3D);

  final lightTextColor = const Color(0xff999999);

  final textFieldColor = const Color(0xffF5F6FA);

  final borderColor = const Color(0xffD9D9D9);

  final _globalKeyLoginForm = GlobalKey<FormState>();

  final _nameController = TextEditingController();

  final _usernameController = TextEditingController();

  final _passwordController = TextEditingController();

  InputDecoration getTextFieldInputDecoration(
      {required String hint, required Widget? prefixIcon, Widget? suffixIcon}) {
    return InputDecoration(
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.r),
        borderSide: const BorderSide(color: Colors.transparent, width: 0),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.r),
        borderSide: const BorderSide(color: Colors.transparent, width: 0),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.r),
        borderSide: const BorderSide(color: Colors.transparent, width: 0),
      ),
      filled: true,
      fillColor: textFieldColor,
      contentPadding: EdgeInsets.symmetric(vertical: 20.h),
      hintText: hint,
      hintStyle: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            child: SvgPicture.asset(
              'assets/svg/login_top_art.svg',
              fit: BoxFit.fill,
              height: 152.h,
              width: 222.w,
            ),
          ),
        ],
      ),
    );
  }
}
