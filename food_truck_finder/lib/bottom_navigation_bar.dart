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
                  Icons.home,
                  color: Colors.white),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: new Icon(
                  Icons.map,
                  color: Colors.white
              ),
              label: 'Map',
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
