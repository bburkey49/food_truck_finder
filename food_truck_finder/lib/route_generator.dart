import 'package:flutter/material.dart';
import 'package:food_truck_finder/landing_page.dart';
import 'home_widget.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => Landing());

      case '/home':
        return MaterialPageRoute(builder: (_) => Home());
    }
  }
}