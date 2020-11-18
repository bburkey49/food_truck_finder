import 'package:flutter/material.dart';

class ProfileWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProfileWidget();
  }
}

class _ProfileWidget extends State<ProfileWidget> {

  Widget _profileIcon() {
    return Container(
      alignment: Alignment.center,
      child: Icon(Icons.person, size: 200),
    );
  }

  Widget _userName() {
    return Container(
      alignment: Alignment.center,
      child: Text("UserName"),
    );
  }

  Widget _savedTrucksButton() {
    return Container(
        width: 175.0,
        height: 40.0,
        alignment: Alignment.center,
        color: Colors.white,
        child: OutlineButton(
          onPressed: () {
            Navigator.of(context).pushNamed(
                '/saved_trucks'
            );
          },
          borderSide: BorderSide(
            color: Colors.black,
            width: 1.5,
          ),
          textColor: Colors.black,
          padding: const EdgeInsets.all(0.0),
          child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: 8.8,
              horizontal: 10.0,
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.airport_shuttle,
                    color: Colors.redAccent,
                  ),
                  SizedBox(width: 5.0),
                  Text('Saved Trucks'),
                ]
            ),
          ),
        )
    );
  }

  Widget _triedTrucksButton() {
    return Container(
        width: 175.0,
        height: 40.0,
        alignment: Alignment.center,
        color: Colors.white,
        child: OutlineButton(
          onPressed: () {
            Navigator.of(context).pushNamed(
                '/tried_trucks'
            );
          },
          borderSide: BorderSide(
            color: Colors.black,
            width: 1.5,
          ),
          textColor: Colors.black,
          padding: const EdgeInsets.all(0.0),
          child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: 8.8,
              horizontal: 10.0,
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.airport_shuttle,
                    color: Colors.yellow,
                  ),
                  SizedBox(width: 5.0),
                  Text('Tried Trucks'),
                ]
            ),
          ),
        )
    );
  }

  Widget _settingButton() {
    return Container(
        width: 175.0,
        height: 40.0,
        alignment: Alignment.center,
        color: Colors.white,
        child: OutlineButton(
          onPressed: () {
            Navigator.of(context).pushNamed(
                '/settings'
            );
          },
          borderSide: BorderSide(
            color: Colors.black,
            width: 1.5,
          ),
          textColor: Colors.black,
          padding: const EdgeInsets.all(0.0),
          child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: 12.0,
              horizontal: 61.0,
            ),
            child: Text('Settings')
            ),
          ),
    );
  }



  Widget _logoutButton() {
    return Container(
      width: 175.0,
      height: 40.0,
      alignment: Alignment.center,
      color: Colors.white,
      child: OutlineButton(
        onPressed: () {
          Navigator.of(context).pushNamed(
              '/'
          );
        },
        borderSide: BorderSide(
          color: Colors.black,
          width: 1.5,
        ),
        textColor: Colors.white,
        padding: const EdgeInsets.all(0.0),
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: <Color>[
                Color(0xFFE53935),
                Color(0xFFF44336),
                Color(0xFFE57373),
              ],
            ),
          ),
          padding: const EdgeInsets.symmetric(
            vertical: 11.0,
            horizontal: 61.0,
          ),
          child:
          const Text('Log out', style: TextStyle(fontSize: 15)),
        ),
      ),
    );

  }


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
                      _profileIcon(),
                      _userName(),
                      SizedBox(height: 15.0),
                      _savedTrucksButton(),
                      SizedBox(height: 5.0),
                      _triedTrucksButton(),
                      SizedBox(height: 5.0),
                      _settingButton(),
                      SizedBox(height: 5.0),
                      _logoutButton(),
                    ],
                  )
              )
          ),
            Container(
              //alignment: Alignment.topRight,
                padding: EdgeInsets.all(12.0),
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
            )
          ]
      ),
    );
  }
}