import 'package:flutter/material.dart';

class SavedTrucksWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SavedTrucksWidget();
  }
}



Widget _savedTrucksTitle() {
  return Container(
    alignment: Alignment.center,
      child: Column(
          children: <Widget>[
            SizedBox(height: 30),
            Icon(
              Icons.airport_shuttle,
              color: Colors.redAccent,
              size: 100
            ),
            Container(
                child: Stack(
                  children: <Widget>[
                    Text(
                      'Saved Trucks',
                      style: TextStyle(
                        fontSize: 40,
                        foreground: Paint()
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = 3
                          ..color = Colors.redAccent,
                      ),
                    ),
                    // Solid text as fill.
                    Text(
                      'Saved Trucks',
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

class _SavedTrucksWidget extends State<SavedTrucksWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.white,
                        Colors.greenAccent
                      ]
                  )
              ),
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
                      Container(
                          child: Stack(
                            children: <Widget>[
                              Text(
                                'WanderTruck',
                                style: TextStyle(
                                  fontSize: 20,
                                  foreground: Paint()
                                    ..style = PaintingStyle.stroke
                                    ..strokeWidth = 3
                                    ..color = Colors.greenAccent,
                                ),
                              ),
                              // Solid text as fill.
                              Text(
                                'WanderTruck',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              )

                            ],
                          )
                      ),
                      Icon(
                          Icons.airport_shuttle,
                          color: Colors.greenAccent,
                          size: 30
                      )
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