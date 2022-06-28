import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nsdd/utils/theme_dark.dart';
import 'package:nsdd/utils/theme_light.dart';
import 'utils/routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
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
        theme: themeDataLight,
        darkTheme: themeDataDark,
        // Routes config
        initialRoute: RouteGenerator.login,
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
      designSize: const Size(375, 812),
    );
  }
}
