import 'package:chuong4/unit_5/app.dart';
import 'package:chuong4/unit_5/config/route_paths.dart';
import 'package:chuong4/unit_5/view/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
            settings: const RouteSettings(name: '/'),
            builder: (_) => const Scaffold());

      case RoutePaths.App:
        return CupertinoPageRoute(
            builder: (context) => const App(),
            settings: const RouteSettings(name: RoutePaths.App));

      case RoutePaths.Home:
        return CupertinoPageRoute(
            builder: (context) => const Home(),
            settings: const RouteSettings(name: RoutePaths.Home));

      default:
        return _errorRoute();
    }
  }

  static Route onGenerateNestedRoute(RouteSettings settings) {
    // this is where you define the nested routes.
    switch (settings.name) {
      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('Something went wrong'),
        ),
      ),
    );
  }
}
