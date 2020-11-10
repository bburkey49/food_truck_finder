import 'package:flutter/material.dart';
import 'settings.dart';

class ProfileWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProfileWidget();
  }
}

class _ProfileWidget extends State<ProfileWidget> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: 400,
          height: 1000,
          margin: EdgeInsets.all(0),
          padding: EdgeInsets.only(top: 100),
        child: Center(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Icon(Icons.person, size: 200),
                Text("UserName"),
                ButtonTheme(
                  minWidth: 175.0,
                  height: 35.0,
                  child: RaisedButton(
                    textColor: Colors.black,
                    child: Text("Saved Trucks"),
                    color: Colors.white,
                    onPressed: () { },
                  )
                ),
                ButtonTheme(
                    minWidth: 175.0,
                    height: 35.0,
                    child: RaisedButton(
                      textColor: Colors.black,
                      child: Text("Trucks I've Tried"),
                      color: Colors.white,
                      onPressed: () { },
                    )
                ),
                ButtonTheme(
                    minWidth: 175.0,
                    height: 35.0,
                    child: RaisedButton(
                      textColor: Colors.black,
                      child: Text("Settings"),
                      color: Colors.white,
                      onPressed: () { },
                    )
                )
              ]
          )
        ),
      ),
    );
  }
}