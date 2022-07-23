import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import '../errors/exceptions.dart';
import '../networks/api_service.dart';
import '../networks/network_client.dart';

class SignupProvider with ChangeNotifier {
  ApiService apiService = ApiService(networkClient: NetworkClient());

  Future<void> submitSignupForm(
    final idController,
    final nameController,
    final shortNameController,
    final contactNoController,
    final passwordController,
    final passwordConfirmationController,
  ) async {
    try {
      final res = await apiService.postSignupForm({
        'id': idController.text,
        'name': nameController.text.trim(),
        'short_name': shortNameController.text.trim(),
        'contact_no': contactNoController.text,
        'password': passwordController.text.trim(),
        'password_confirmation': passwordConfirmationController.text.trim(),
      });
      Logger().i(res.toString());
      Map<String, dynamic> mp = jsonDecode(res.toString());
      if (mp['success']) {
        idController.clear();
        nameController.clear();
        shortNameController.clear();
        contactNoController.clear();
        passwordController.clear();
        passwordConfirmationController.clear();
      }
    } on RemoteException catch (e) {
      Logger().e(e.dioError);
    }
  }
}
