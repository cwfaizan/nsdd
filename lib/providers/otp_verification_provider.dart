import 'package:flutter/material.dart';
import 'package:nsdd/networks/network_client.dart';
import 'package:nsdd/utils/helper.dart';

class OTPVerificationProvider with ChangeNotifier {
  NetworkClient networkClient = NetworkClient();
  bool otpVerified = true;

  Future<void> verifyOTP(
    final otpFormKey,
    BuildContext context,
    final args,
    final pin,
  ) async {
    final res = await networkClient.post(
      '/verify-pin',
      {
        'user_id': args['user_id'],
        'pin_type': args['pin_type'],
        'pin': int.parse(pin),
      },
    );
    if (res.statusCode == 200) {
      if (args['pin_type'] == 3) {
        Helper.showSnackBar(
            context: context, message: 'Please login to continue');
      }
      // ignore: use_build_context_synchronously
      Navigator.pushReplacementNamed(
        context,
        args['page_route'],
      );
    } else {
      otpVerified = false;
      otpFormKey.currentState!.validate();
    }
  }
}
