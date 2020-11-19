import 'package:flutter/material.dart';

class SettingsWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SettingsWidget();
  }
}

class _SettingsWidget extends State<SettingsWidget> {

  Widget _settingsIcon() {
    return Container(
      alignment: Alignment.center,
      child: Icon(Icons.settings, size: 200),
    );
  }

  Widget _settingsTitle() {
    return Container(
        alignment: Alignment.center,
        child: Container(
            child: Stack(
              children: <Widget>[
                Text(
                  'Settings',
                  style: TextStyle(
                    fontSize: 40,
                    foreground: Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 3
                      ..color = Colors.black,
                  ),
                ),
                // Solid text as fill.
                Text(
                  'Settings',
                  style: TextStyle(
                    fontSize: 40,
                    color: Colors.white,
                  ),
                )
              ],
            )
        ),
    );
  }

  Widget _changeProfilePicButton() {
    return Container(
      width: 200.0,
      height: 40.0,
      alignment: Alignment.center,
      color: Colors.white,
      child: OutlineButton(
        onPressed: () {},
        borderSide: BorderSide(
          color: Colors.black,
          width: 1.5,
        ),
        textColor: Colors.black,
        padding: const EdgeInsets.all(0.0),
        child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: 12.0,
              horizontal: 29.0,
            ),
            child: Text('Change Profile Picture')
        ),
      ),
    );
  }

  Widget _changePasswordButton() {
    return Container(
      width: 200.0,
      height: 40.0,
      alignment: Alignment.center,
      color: Colors.white,
      child: OutlineButton(
        onPressed: () {},
        borderSide: BorderSide(
          color: Colors.black,
          width: 1.5,
        ),
        textColor: Colors.black,
        padding: const EdgeInsets.all(0.0),
        child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: 12.0,
              horizontal: 43.0,
            ),
            child: Text('Change Password')
        ),
      ),
    );
  }

  Widget _dietaryButton() {
    return Container(
      width: 200.0,
      height: 40.0,
      alignment: Alignment.center,
      color: Colors.white,
      child: OutlineButton(
        onPressed: () {},
        borderSide: BorderSide(
          color: Colors.black,
          width: 1.5,
        ),
        textColor: Colors.black,
        padding: const EdgeInsets.all(0.0),
        child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: 12.0,
              horizontal: 10.0,
            ),
            child: Text('Manage Dietary Restrictions')
        ),
      ),
    );
  }

  Widget _locationSettingsButton() {
    return Container(
      width: 200.0,
      height: 40.0,
      alignment: Alignment.center,
      color: Colors.white,
      child: OutlineButton(
        onPressed: () {},
        borderSide: BorderSide(
          color: Colors.black,
          width: 1.5,
        ),
        textColor: Colors.black,
        padding: const EdgeInsets.all(0.0),
        child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: 12.0,
              horizontal: 45.0,
            ),
            child: Text('Manage Location')
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
                        SizedBox(height: 50.0),
                        _settingsIcon(),
                        _settingsTitle(),
                        SizedBox(height: 15.0),
                        _changeProfilePicButton(),
                        SizedBox(height: 15.0),
                        _changePasswordButton(),
                        SizedBox(height: 15.0),
                        _dietaryButton(),
                        SizedBox(height: 15.0),
                        _locationSettingsButton(),
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