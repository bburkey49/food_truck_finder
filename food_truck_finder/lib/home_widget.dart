import 'package:flutter/material.dart';
import 'package:food_truck_finder/map.dart';
import 'search_bar.dart';
import 'placeholder_widget.dart';
import 'list_view.dart';
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
    MapPage(),
    ListViewPage(),
    ProfileWidget()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          // title: IconButton(
          //     icon: Image.asset('assets/images/logo.png'),
          //   iconSize: 200.0,
          //   onPressed: () {
          //     Navigator.of(context).pushNamed(
          //         '/map'
          //     );
          //   },
          //   ),
            title: Image.asset(
                'assets/images/logo.png',
                width: 200.0,
              alignment: Alignment.centerRight
            ),
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
  void setIndex(int index){
    setState(() {
      _currentIndex = index;
    });
  }

}


