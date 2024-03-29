import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:happy/splash/dashhboard_screen.dart';
import 'package:happy/splash/home_screen.dart';
import 'package:happy/splash/settings_screen.dart';
import 'package:happy/splash/splash_page.dart';
import 'package:happy/splash/tabbar_screen.dart';
import 'package:happy/src/person_settings_screen.dart';

Route routes(RouteSettings settings) {
  switch (settings.name) {
    case '/splash':
      return MaterialPageRoute(builder: (_) => const SplashPage());
    case 'home':
      return MaterialPageRoute(builder: (_) => const Homescreen());
    case '/':
      return MaterialPageRoute(builder: (_) => const PersonSettingsScreen());
    case '/splash/tabbar_screen':
      return MaterialPageRoute(builder: (_) => const TabBarScreen());
    default:
      return MaterialPageRoute(builder: (_) => const SettingsScreen());
  }
}
//PersonSettingsScreen