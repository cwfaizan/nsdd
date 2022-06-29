import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nsdd/utils/constants.dart';
import 'package:nsdd/utils/file_path.dart';
import 'package:pinput/pinput.dart';

class OtpPage extends StatelessWidget {
  const OtpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 60.w,
      height: 60.h,
      textStyle: TextStyle(
        fontSize: 24,
        color: Theme.of(context).colorScheme.primary,
        fontWeight: FontWeight.bold,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).colorScheme.primary,
          width: 3,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(
        color: Theme.of(context).colorScheme.secondary,
        width: 3,
      ),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        color: const Color.fromRGBO(234, 239, 243, 1),
      ),
    );
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            child: SvgPicture.asset(
              FilePath.topRightCornerBg,
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
                      'Verify',
                      style: Theme.of(context).textTheme.headline3,
                    ),
                    kPageItemSpacing,
                    Text(
                      'We sent code to 034*******1 to verify your account',
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                            color: kGrayColor,
                          ),
                    ),
                    kPageItemSpacing,
                    Align(
                      alignment: Alignment.center,
                      child: Pinput(
                        defaultPinTheme: defaultPinTheme,
                        focusedPinTheme: focusedPinTheme,
                        submittedPinTheme: submittedPinTheme,
                        validator: (s) {
                          return s == '1234' ? null : 'Pin is incorrect';
                        },
                        pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                        showCursor: true,
                        onCompleted: (pin) => print(pin),
                      ),
                    ),
                    kPageItemSpacing2,
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: const Text('Verify'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
