import 'package:flutter/material.dart';

class TriedTrucksWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TriedTrucksWidget();
  }
}



Widget _triedTrucksTitle() {
  return Container(
      alignment: Alignment.center,
      child: Column(
          children: <Widget>[
            SizedBox(height: 30),
            Icon(
                Icons.airport_shuttle,
                color: Colors.yellow,
                size: 100
            ),
            Container(
                child: Stack(
                  children: <Widget>[
                    Text(
                      'Tried Trucks',
                      style: TextStyle(
                        fontSize: 40,
                        foreground: Paint()
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = 3
                          ..color = Colors.yellow,
                      ),
                    ),
                    // Solid text as fill.
                    Text(
                      'Tried Trucks',
                      style: TextStyle(
                        fontSize: 40,
                        color: Colors.white,
                      ),
                    )

                  ],
                )
            ),
          ]
      )
  );
}

class _TriedTrucksWidget extends State<TriedTrucksWidget> {
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
                        SizedBox(height: 30.0),
                        _triedTrucksTitle()
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
                color: Colors.green,
                splashColor: Colors.purple,
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