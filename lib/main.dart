import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nsdd/pages/login_page.dart';
import 'package:nsdd/pages/profile_page.dart';

import 'utils/routes.dart';
import 'utils/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        // Theme config
        themeMode: ThemeMode.system,
        theme: appThemeData[AppTheme.Light],
        darkTheme: appThemeData[AppTheme.Dark],
        // Routes config
        initialRoute: RouteGenerator.login,
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
      designSize: const Size(375, 812),
    );
  }
}
