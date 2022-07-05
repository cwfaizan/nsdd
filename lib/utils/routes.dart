import 'package:flutter/material.dart';
import 'package:nsdd/pages/alumni_page.dart';
import 'package:nsdd/pages/change_password_page.dart';
import 'package:nsdd/pages/edit_qualification_page.dart';
import 'package:nsdd/pages/forgot_password_page.dart';
import 'package:nsdd/pages/home_page.dart';
import 'package:nsdd/pages/login_page.dart';
import 'package:nsdd/pages/otp_page.dart';
import 'package:nsdd/pages/profile_page.dart';
import 'package:nsdd/pages/qualification_page.dart';
import 'package:nsdd/pages/signup_page.dart';

import '../errors/exceptions.dart';
import '../pages/edit_profile_page.dart';

class RouteGenerator {
  static const String splash = '/';
  static const String login = 'login';
  static const String signup = 'signup';
  static const String forgotPassword = 'forgotPassword';
  static const String otp = 'otp';
  static const String home = 'home';
  static const String changePassword = 'changePassword';
  static const String editProfile = 'editProfile';
  static const String profile = 'profile';
  static const String qualification = 'qualification';
  static const String editQualification = 'editQualification';
  static const String alumni = 'alumni';

  RouteGenerator._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case login:
        return MaterialPageRoute(builder: (_) => LoginPage());
      case signup:
        return MaterialPageRoute(builder: (_) => SignupPage());
      case forgotPassword:
        return MaterialPageRoute(builder: (_) => ForgotPasswordPage());
      case otp:
        return MaterialPageRoute(builder: (_) => const OtpPage());
      case home:
        return MaterialPageRoute(builder: (_) => HomePage());
      case changePassword:
        return MaterialPageRoute(builder: (_) => ChangePasswordPage());
      case editProfile:
        return MaterialPageRoute(builder: (_) => EditProfilePage());
      case profile:
        return MaterialPageRoute(builder: (_) => const ProfilePage());
      case qualification:
        return MaterialPageRoute(builder: (_) => const QualificationPage());
      case editQualification:
        return MaterialPageRoute(builder: (_) => EditQualificationPage());
      case alumni:
        return MaterialPageRoute(builder: (_) => AlumniPage());
      default:
        throw RouteException('Route not found');
    }
  }
}
