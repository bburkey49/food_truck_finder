import 'package:flutter/material.dart';
import 'placeholder_widget.dart';
import 'profile_widget.dart';
//Brian is an idiot for understanding github
import 'sign_up.dart';
import 'bottom_navigation_bar.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}


class _HomeState extends State<Home> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    PlaceholderWidget(Colors.white),
    PlaceholderWidget(Colors.orange),
    ProfileWidget()
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


