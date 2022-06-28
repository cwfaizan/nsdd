import 'package:flutter/material.dart';
import 'package:nsdd/pages/forget_password.dart';
import 'package:nsdd/pages/login_page.dart';
import 'package:nsdd/pages/signup_page.dart';

import '../errors/exceptions.dart';

class RouteGenerator {
  static const String splash = '/';
  static const String login = 'login';
  static const String signup = 'signup';
  static const String forgetPassword = 'forgetPassword';
  RouteGenerator._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case login:
        return MaterialPageRoute(builder: (_) => LoginPage());
      case signup:
        return MaterialPageRoute(builder: (_) => SignupPage());
      case forgetPassword:
        return MaterialPageRoute(builder: (_) => ForgetPasswordPage());
      default:
        throw RouteException('Route not found');
    }
  }
}
