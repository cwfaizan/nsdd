import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nsdd/providers/country_provider.dart';
import 'package:nsdd/utils/theme_dark.dart';
import 'package:nsdd/utils/theme_light.dart';
import 'package:provider/provider.dart';
import 'providers/password_provider.dart';
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
      builder: (context, child) => MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => PasswordProvider(),
          ),
          ChangeNotifierProvider(
            create: (_) => CountryProvider(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          // Theme config
          themeMode: ThemeMode.system,
          theme: themeDataLight,
          darkTheme: themeDataDark,
          // Routes config
          initialRoute: RouteGenerator.editProfile,
          onGenerateRoute: RouteGenerator.generateRoute,
        ),
      ),
      designSize: const Size(375, 812),
    );
  }
}
