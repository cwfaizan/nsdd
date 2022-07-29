import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:nsdd/pages/otp_page.dart';

import '../errors/exceptions.dart';
import '../networks/network_client.dart';

class SignupProvider with ChangeNotifier {
  // ApiService apiService = ApiService(networkClient: NetworkClient());
  NetworkClient networkClient = NetworkClient();

  Future<void> submitSignupForm(
    BuildContext context,
    final idController,
    final nameController,
    final shortNameController,
    final contactNoController,
    final passwordController,
    final passwordConfirmationController,
  ) async {
    try {
      final res = await networkClient.post(
        '/signup',
        {
          'id': idController.text,
          'name': nameController.text.trim(),
          'short_name': shortNameController.text.trim(),
          'contact_no': contactNoController.text,
          'password': passwordController.text.trim(),
          'password_confirmation': passwordConfirmationController.text.trim(),
        },
      );
      if (res.statusCode == 200) {
        Map<String, dynamic> mp = jsonDecode(res.toString());
        nameController.clear();
        shortNameController.clear();
        contactNoController.clear();
        passwordController.clear();
        passwordConfirmationController.clear();
        // ignore: use_build_context_synchronously
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => OtpPage(
              args: {
                'user_id': idController.text,
                'pin_message': mp['data']['pin_message'],
                'pin_type': mp['data']['pin_type'],
              },
            ),
          ),
        );
        // idController.clear();
      } else {
        // idController.
      }
    } on RemoteException catch (e) {
      Logger().e(e.dioError);
    }
  }
}
