import 'package:flutter/cupertino.dart';
import 'package:logger/logger.dart';
import 'package:nsdd/errors/exceptions.dart';
import 'package:nsdd/networks/network_client.dart';
import 'package:nsdd/utils/helper.dart';

class ChangePasswordProvider with ChangeNotifier {
  NetworkClient networkClient = NetworkClient();
  Future<void> changePassword(
      BuildContext context,
      final toggleLoader,
      final currentPasswordController,
      final passwordController,
      final passwordConfirmationController) async {
    try {
      final res = await networkClient.post(
        '/change-password',
        {
          'current_password': currentPasswordController.text.trim(),
          'password': passwordController.text.trim(),
          'password_confirmation': passwordConfirmationController.text.trim(),
        },
        token: Helper.token,
      );
      currentPasswordController.clear();
      passwordController.clear();
      passwordConfirmationController.clear();
      if (res.statusCode == 200) {
        Helper.showSnackBar(
            context: context, message: 'Password successfully changed');
        // ignore: use_build_context_synchronously
        // Navigator.pop(context);
      }
    } on RemoteException catch (e) {
      Logger().e(e.dioError);
    } finally {
      toggleLoader();
    }
  }
}
