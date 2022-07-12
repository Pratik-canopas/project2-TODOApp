import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:project2/Routes..dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  ThemeData lightTheme = ThemeData(
    useMaterial3: true,
  );
  ThemeData darkTheme = ThemeData(
    useMaterial3: true,
  );

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: lightTheme,
      darkTheme: darkTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.homeView,
      routes: AppRoutes.allRoutes,
    );
  }
}
