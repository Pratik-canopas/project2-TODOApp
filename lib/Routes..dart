import 'package:flutter/material.dart';
import 'package:project2/views/HomeView/HomeView.dart';

class AppRoutes {
  static String homeView = "/";
  static Map<String, Widget Function(BuildContext)> allRoutes = {
    homeView: (context) => const HomeView(),
  };
}