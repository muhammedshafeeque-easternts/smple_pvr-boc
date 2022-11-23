import 'package:flutter/material.dart';
import 'package:sampl/main.dart';
import 'package:sampl/ui/detail_screen.dart';

import '../ui/home_screen.dart';

class AppRoutes {
  static const bottomNavWidget = "/";
  static const homeScreen = "home_screen";
  static const detailScreen = "detail_screen";


  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(
        settings: settings,
        builder: (_) {
          switch (settings.name) {
            case bottomNavWidget:
              return const BottomNavWidget();
            case homeScreen:
              return   HomeScreen();
            case detailScreen:
              return   DetailScreen(movieId:settings.arguments as String);
            default:
              return const Text("Route Erro");
          }
        });
  }
}