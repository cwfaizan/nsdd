import 'package:flutter/material.dart';
import 'package:nsdd/pages/login_page.dart';

import '../errors/exceptions.dart';

class RouteGenerator {
  static const String splash = '/';
  static const String login = 'login';
  RouteGenerator._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case login:
        return MaterialPageRoute(builder: (_) => const LoginPage());
      default:
        throw RouteException('Route not found');
    }
  }
}
