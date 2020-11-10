import 'package:flutter/material.dart';


class NavBar {
  static BottomNavigationBar generateNavBar(tapAction, index) {
    return(
        BottomNavigationBar(
          onTap: tapAction,
          currentIndex: index,
          items: [
            BottomNavigationBarItem(
              icon: new Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.map),
              label: 'Map',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            )
          ],
        )
    );
  }
}
