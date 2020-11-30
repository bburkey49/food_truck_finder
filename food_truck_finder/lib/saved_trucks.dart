import 'package:flutter/material.dart';
import 'globals.dart';

class SavedTrucksWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SavedTrucksWidget();
  }
}


Widget _truck() {

  return Image.asset(
    'assets/images/savedTruck.png',
    color: Colors.redAccent,
    width: 200.0,
    alignment: Alignment.topCenter,
    semanticLabel: 'saved truck icon',
  );
}

Widget _savedTrucksTitle() {
  return Container(
    alignment: Alignment.center,
    child: Column(
      children: <Widget>[
        Text(
          'Saved Trucks',
          style: TextStyle(
            fontSize: 25,
            color: Colors.teal,
          )
        )
      ]
    )
  );
}

class _SavedTrucksWidget extends State<SavedTrucksWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
            ),
            Container(
                height: MediaQuery.of(context).size.height,
                child: SingleChildScrollView(
                    physics: AlwaysScrollableScrollPhysics(),
                    padding: EdgeInsets.symmetric(
                        horizontal: 40.0,
                        vertical: 30.0
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(height: 110.0),
                        _truck(),
                        _savedTrucksTitle()
                      ],
                    )
                )
            ),
            Container(
              //alignment: Alignment.topRight,
                padding: EdgeInsets.symmetric(
                  vertical: 40.0,
                  horizontal: 20.0,
                ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Image.asset(
                          'assets/images/logo.png',
                      width: 200.0,
                      ),
                    ]
                )
            ),
            Container(
              padding: EdgeInsets.symmetric(
                vertical: 30.0,
                horizontal: 20.0,
              ),
              alignment: Alignment.topLeft,
              child: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                ),
                iconSize: 40,
                color: Colors.teal,
                splashColor: Colors.redAccent,
                onPressed: () {
                  Navigator.pop(context);
                 },
              ),
            ),
          ]
      ),
    );
  }
}