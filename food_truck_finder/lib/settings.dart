import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SettingsState();
  }
  Settings settingsRoute() {
    return Settings();
  }
}


class _SettingsState extends State<Settings> {
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: new AppBar(
        title: Text('Food Truck App'),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        padding: EdgeInsets.all(25),
        child: Center(
          child: Column(
            children: <Widget>[
              new FloatingActionButton(
                  elevation: 20.0,
                  child: new Icon(Icons.settings),
                  backgroundColor: Colors.grey,
                  onPressed: (){}
              )

            ],
          ),
        ),
      ),
    );
  }

}