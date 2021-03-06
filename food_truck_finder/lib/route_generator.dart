import 'package:flutter/material.dart';
import 'package:food_truck_finder/login.dart';
import 'package:food_truck_finder/search_b.dart';
import 'package:food_truck_finder/sign_up.dart';
import 'package:food_truck_finder/truck.dart';
import 'package:food_truck_finder/truck_info_page.dart';
import 'home_widget.dart';
import 'saved_trucks.dart';
import 'tried_trucks.dart';
import 'settings.dart';
import 'forgot_password.dart';
import 'map.dart';
import 'dietary_restrictions.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    //final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => Login());

      case '/home':
        return MaterialPageRoute(builder: (_) => Home());

      case '/sign_up':
        return MaterialPageRoute(builder: (_) => SignUp());

      case '/truck_info':
        return MaterialPageRoute(builder: (context) => TruckInfo());

      case '/search_filter':
        return MaterialPageRoute(builder: (_) => SearchB());

      case '/saved_trucks':
        return MaterialPageRoute(builder: (_) => SavedTrucksWidget());

      case '/tried_trucks':
        return MaterialPageRoute(builder: (_) => TriedTrucksWidget());

      case '/settings':
        return MaterialPageRoute(builder: (_) => SettingsWidget());

      case '/forgot_password':
        return MaterialPageRoute(builder: (_) => ForgotPassword());

      case '/filters':
        return MaterialPageRoute(builder: (_) => SearchB());

      case '/map':
        return MaterialPageRoute(builder: (_) => MapPage());

      case '/dietary':
        return MaterialPageRoute(builder: (_) => DietaryWidget());
    }
  }
}