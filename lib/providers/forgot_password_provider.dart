import 'package:flutter/material.dart';
import 'package:nsdd/networks/network_client.dart';
import 'package:nsdd/utils/routes.dart';

class ForgotPasswordProvider with ChangeNotifier {
  NetworkClient nc = NetworkClient();
  Future<void> forgotPassword(
      BuildContext context, final contactNoController) async {
    final res = await nc
        .post('/forgot-password', {'contact_no': contactNoController.text});
    if (res.statusCode == 200) {
      // ignore: use_build_context_synchronously
      Navigator.pushNamed(
        context,
        RouteGenerator.otp,
      );
    }
  }

  void resetPassword() {}
}
