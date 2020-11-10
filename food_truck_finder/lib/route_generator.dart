import 'package:flutter/material.dart';
import 'package:food_truck_finder/login.dart';
import 'package:food_truck_finder/sign_up.dart';
import 'home_widget.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => Login());

      case '/home':
        return MaterialPageRoute(builder: (_) => Home());

      case '/sign_up':
        return MaterialPageRoute(builder: (_) => SignUp());
    }
  }
}