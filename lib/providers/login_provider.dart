import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:nsdd/errors/exceptions.dart';
import 'package:nsdd/models/user.dart';
import 'package:nsdd/networks/network_client.dart';
import 'package:nsdd/utils/helper.dart';
import 'package:nsdd/utils/routes.dart';

class LoginProvider with ChangeNotifier {
  NetworkClient networkClient = NetworkClient();
  Future<void> login(BuildContext context, final toggleLoader,
      final idController, final passwordController) async {
    try {
      final res = await networkClient.post(
        '/login',
        {
          'id': idController.text,
          'password': passwordController.text.trim(),
        },
      );
      passwordController.clear();
      if (res.statusCode == 200) {
        Map<String, dynamic> mp = jsonDecode(res.toString());
        User user = User.fromJson(mp['data']);
        Helper.addUser(user);
        // ignore: use_build_context_synchronously
        Navigator.pushReplacementNamed(
          context,
          RouteGenerator.home,
        );
      }
    } on RemoteException catch (e) {
      Logger().e(e.dioError);
    } finally {
      toggleLoader();
    }
  }
}
