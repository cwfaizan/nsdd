import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pinput/pinput.dart';

class OtpPage extends StatelessWidget {
  const OtpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 60.w,
      height: 60.h,
      textStyle: const TextStyle(
        fontSize: 24,
        color: Color(0xFFEC7C03),
        fontWeight: FontWeight.bold,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0xFFEC7C03),
          width: 3,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: const Color.fromRGBO(114, 178, 238, 1)),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        color: const Color.fromRGBO(234, 239, 243, 1),
      ),
    );
    return Scaffold(
      body: Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            SvgPicture.asset(
              'assets/icons/art_two.svg',
              width: MediaQuery.of(context).size.width,
            ),
            Positioned(
              top: 120,
              left: 0,
              right: 0,
              child: SvgPicture.asset(
                'assets/icons/logo_dark.svg',
                height: 55.h,
              ),
            ),
            Positioned(
              top: 50,
              left: 10,
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Padding(
                    padding: EdgeInsets.all(12),
                    child: Icon(
                      Icons.close,
                      color: Colors.black,
                      size: 30,
                    )),
              ),
            ),
            Positioned(
              top: 200,
              left: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25.r),
                    topRight: Radius.circular(25.r),
                  ),
                ),
                height: MediaQuery.of(context).size.height / 1.9,
                width: double.infinity,
                margin: EdgeInsets.symmetric(
                  vertical: 15.h,
                ),
                padding: EdgeInsets.symmetric(
                  vertical: 15.h,
                  horizontal: 20.w,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'OTP',
                        style: TextStyle(
                          color: const Color(0xFF002448),
                          fontSize: 24.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Text(
                        'Enter Otp',
                        style: TextStyle(
                          color: const Color(0xFF002448).withOpacity(0.8),
                          fontSize: 12.sp,
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Pinput(
                          defaultPinTheme: defaultPinTheme,
                          focusedPinTheme: focusedPinTheme,
                          submittedPinTheme: submittedPinTheme,
                          validator: (s) {
                            return s == '1234' ? null : 'Pin is incorrect';
                          },
                          pinputAutovalidateMode:
                              PinputAutovalidateMode.onSubmit,
                          showCursor: true,
                          onCompleted: (pin) => print(pin),
                        ),
                      ),
                      SizedBox(
                        height: 18.h,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: const Text('Verify'),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
