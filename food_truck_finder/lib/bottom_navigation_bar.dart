import 'package:flutter/material.dart';


class NavBar {
  static BottomNavigationBar generateNavBar(tapAction, index) {
    return(
        BottomNavigationBar(
          backgroundColor: Colors.teal,
          onTap: tapAction,
          unselectedItemColor: Colors.white,
          selectedItemColor: Colors.white,
          currentIndex: index,
          items: [
            BottomNavigationBarItem(
              icon: new Icon(
                  Icons.map,
                  color: Colors.white),
              label: 'Map',
            ),
            BottomNavigationBarItem(
              icon: new Icon(
                  Icons.format_list_bulleted_rounded,
                  color: Colors.white
              ),
              label: 'List',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                  Icons.person,
                  color: Colors.white
              ),
              label: 'Profile',
            )
          ],
        )
    );
  }
}
