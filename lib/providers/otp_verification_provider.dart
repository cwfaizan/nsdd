import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:nsdd/networks/network_client.dart';
import 'package:nsdd/utils/routes.dart';

class OTPVerificationProvider with ChangeNotifier {
  NetworkClient networkClient = NetworkClient();

  Future<void> verifyOTP(
      BuildContext context, final id, final pinType, final pin) async {
    final res = await networkClient.post(
      '/verify-contact-no',
      {
        'id': id,
        'pin_type': pinType,
        'pin': pin,
      },
    );
    Map<String, dynamic> mp = jsonDecode(res.toString());
    if (mp['success']) {
      // ignore: use_build_context_synchronously
      Navigator.pushReplacementNamed(
        context,
        RouteGenerator.home,
      );
    }
  }
}
