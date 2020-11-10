import 'package:flutter/material.dart';
import 'bottom_navigation_bar.dart';
import 'login.dart';

class Landing extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LandingState();
  }
}


class _LandingState extends State<Landing> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    Login()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Food Truck Finder'),
        ),
        body: _children[_currentIndex],
        bottomNavigationBar: NavBar.generateNavBar(onTabTapped, _currentIndex)
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

}

