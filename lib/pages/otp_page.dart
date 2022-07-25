import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nsdd/providers/otp_verification_provider.dart';
import 'package:nsdd/utils/constants.dart';
import 'package:nsdd/utils/file_path.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

class OtpPage extends StatelessWidget {
  final Map<String, dynamic> args;
  OtpPage({super.key, required this.args});
  final _otpFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 60.w,
      height: 60.h,
      textStyle: TextStyle(
        fontSize: 24.sp,
        color: Theme.of(context).colorScheme.primary,
        fontWeight: FontWeight.bold,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).colorScheme.primary,
          width: 3,
        ),
        borderRadius: BorderRadius.circular(10.r),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(
        color: Theme.of(context).colorScheme.secondary,
        width: 3,
      ),
      borderRadius: BorderRadius.circular(10.r),
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
              FilePath.topRightCornerBg(context),
            ),
          ),
          Positioned(
            top: 30.h,
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Padding(
                padding: REdgeInsets.all(12.w),
                child: Icon(
                  Icons.arrow_back,
                  color: Theme.of(context).primaryColor,
                  size: 30.w,
                ),
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: kPagePadding,
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Verify',
                        style: Theme.of(context).textTheme.headline3,
                      ),
                      kPageItemSpacing2,
                      Text(
                        args['message'],
                        style: Theme.of(context).textTheme.headline6!.copyWith(
                              color: kGrayColor,
                            ),
                      ),
                      kPageItemSpacing2,
                      Form(
                        key: _otpFormKey,
                        child: Consumer<OTPVerificationProvider>(
                          builder: (context, otp, child) => Pinput(
                            androidSmsAutofillMethod:
                                AndroidSmsAutofillMethod.smsRetrieverApi,
                            defaultPinTheme: defaultPinTheme,
                            focusedPinTheme: focusedPinTheme,
                            submittedPinTheme: submittedPinTheme,
                            validator: (s) {
                              return otp.otpVerified
                                  ? null
                                  : 'Pin is incorrect';
                            },
                            pinputAutovalidateMode:
                                PinputAutovalidateMode.onSubmit,
                            showCursor: true,
                            onCompleted: (pin) {
                              otp.otpVerified = true;
                              Provider.of<OTPVerificationProvider>(context,
                                      listen: false)
                                  .verifyOTP(
                                      _otpFormKey, context, args['id'], 1, pin);
                            },
                          ),
                        ),
                      ),
                      kPageItemSpacing4,
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
          ),
        ],
      ),
    );
  }
}
