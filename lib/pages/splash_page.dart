import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nsdd/utils/file_path.dart';
import 'package:nsdd/utils/helper.dart';
import 'package:nsdd/utils/routes.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
    isLoggedIn();
    super.initState();
    // Future.delayed(const Duration(milliseconds: 1600), () {
    //   setState(() {
    //     Navigator.pushReplacement(context,
    //         MaterialPageRoute(builder: (context) => const LoginPage()));
    //   });
    // });
  }

  void isLoggedIn() async {
    bool isLogin = await Helper.isUserLogin();
    // ignore: use_build_context_synchronously
    Navigator.pushReplacementNamed(
      context,
      isLogin ? RouteGenerator.home : RouteGenerator.login,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: REdgeInsets.all(64.0),
          child: Image.asset(FilePath.nutechLogo),
        ),
      ),
    );
  }
}
