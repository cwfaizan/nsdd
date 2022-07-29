import 'package:flutter/material.dart';
import 'package:nsdd/networks/network_client.dart';
import 'package:nsdd/utils/helper.dart';
import 'package:nsdd/utils/routes.dart';

class OTPVerificationProvider with ChangeNotifier {
  NetworkClient networkClient = NetworkClient();
  bool otpVerified = true;

  Future<void> verifyOTP(
    final otpFormKey,
    BuildContext context,
    final userId,
    final pinType,
    final pin,
  ) async {
    final res = await networkClient.post(
      '/verify-pin',
      {
        'user_id': userId,
        'pin_type': pinType,
        'pin': int.parse(pin),
      },
    );
    if (res.statusCode == 200) {
      if (pinType == 3) {
        Helper.showSnackBar(
            context: context, message: 'Please login to continue');
      }
      // ignore: use_build_context_synchronously
      Navigator.pushReplacementNamed(
        context,
        RouteGenerator.login,
      );
    } else {
      otpVerified = false;
      otpFormKey.currentState!.validate();
    }
  }
}
