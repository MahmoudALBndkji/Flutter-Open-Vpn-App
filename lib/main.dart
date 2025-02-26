import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vpn_basic_project/helper/app_helper.dart';
import 'package:vpn_basic_project/screens/home_screen.dart';

late Size sizeScreen;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppHelper.initHive();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: AppHelper.isModeDark ? ThemeMode.dark : ThemeMode.light,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          centerTitle: true,
          elevation: 3.0,
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        appBarTheme: AppBarTheme(
          centerTitle: true,
          elevation: 3.0,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

extension AppTheme on ThemeData {
  Color get lightTextColor =>
      AppHelper.isModeDark ? Colors.white70 : Colors.black54;
  Color get bottomNavigationBar =>
      AppHelper.isModeDark ? Colors.white12 : Colors.redAccent;
}
