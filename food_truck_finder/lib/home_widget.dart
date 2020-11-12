import 'package:flutter/material.dart';
import 'package:food_truck_finder/map.dart';
import 'placeholder_widget.dart';
import 'profile_widget.dart';
//Brian is an idiot for understanding github
import 'bottom_navigation_bar.dart';
import 'truck_info_page.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeState();
}


class _HomeState extends State<Home> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    TruckInfo(),
    MapPage(),
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


