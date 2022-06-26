import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TestPage extends StatefulWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
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

  bool showLoader = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40.w),
        child: Form(
          key: _globalKeyLoginForm,
          child: showLoader
              ? const Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                  child: getLoginForm(context),
                ),
        ),
      ),
    );
  }

  Widget getLoginForm(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 62.h),
        SvgPicture.asset(
          'assets/images/icons/1.svg',
          fit: BoxFit.fill,
          height: 296.h,
          width: 296.w,
        ),
        SizedBox(height: 20.h),
        TextFormField(
          // controller: _nameController,
          controller: _nameController..text = 'Faizan',
          keyboardType: TextInputType.name,
          textInputAction: TextInputAction.next,
          decoration: getTextFieldInputDecoration(
            icon: Icons.account_box,
            hint: 'name',
          ),
          validator: (value) {
            if (value == null) {
              return null;
            }
            if (value.trim().isEmpty) {
              return 'Name is required!';
            }
            return null;
          },
        ),
        SizedBox(height: 20.h),
        TextFormField(
          // controller: _usernameController,
          controller: _usernameController..text = '2364882095',
          keyboardType: TextInputType.number,
          textInputAction: TextInputAction.next,
          decoration: getTextFieldInputDecoration(
            icon: Icons.verified_user,
            hint: 'username',
          ),
          // onSaved: (value) {
          //   _userEmail = value ?? '';
          // },
          validator: (value) {
            if (value == null) {
              return null;
            }
            if (value.trim().isEmpty) {
              return 'username is required!';
            }
            return null;
          },
        ),
        SizedBox(height: 20.h),
        SizedBox(height: 20.h),
        SizedBox(
          width: double.infinity,
          child: TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              // side: BorderSide(color: borderColor),
              backgroundColor: orangeColor,
              padding: EdgeInsets.symmetric(vertical: 20.h),
              textStyle: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            // child: const Text(
            //   'Login',
            //   style: TextStyle(
            //     color: Colors.black,
            //     fontWeight: FontWeight.bold,
            //   ),
            // ),
            child: Text(
              'Login',
              style: Theme.of(context)
                  .textTheme
                  .headline1!
                  .copyWith(color: Colors.redAccent),
            ),
          ),
        ),
      ],
    );
  }

  InputDecoration getTextFieldInputDecoration(
      {required String hint, required IconData icon, Widget? suffixIcon}) {
    return InputDecoration(
      prefixIcon: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(width: 20.w),
          Icon(icon),
          SizedBox(
            height: 15.h,
            child: const VerticalDivider(color: Colors.grey),
          )
        ],
      ),
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
}
