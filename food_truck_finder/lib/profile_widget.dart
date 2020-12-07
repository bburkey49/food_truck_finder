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
      width: 175.0,
      height: 175.0,
      decoration: new BoxDecoration(
        shape: BoxShape.circle,
        image: new DecorationImage(
          fit: BoxFit.fill,
          image: new AssetImage('assets/images/profileImg.jpg'),
        )
    ),
      alignment: Alignment.center,
    );
  }

  Widget _userName() {
    return Container(
      alignment: Alignment.center,
      child: Text(
          "Emily W",
        style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.teal,
        )
      ),
    );
  }

  Widget _savedTrucksButton() {
    return Container(
        width: 225.0,
        height: 50.0,
        alignment: Alignment.center,
        color: Colors.white,
        child: OutlineButton(
          onPressed: () {
            Navigator.of(context).pushNamed(
                '/saved_trucks'
            );
          },
          borderSide: BorderSide(
            color: Colors.teal,
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
                  ImageIcon(
                    AssetImage('assets/images/savedTruck.png'),
                    color: Colors.redAccent,
                  ),
                  SizedBox(width: 5.0),
                  Text('Liked Trucks'),
                ]
            ),
          ),
        )
    );
  }

  Widget _triedTrucksButton() {
    return Container(
        width: 225.0,
        height: 50.0,
        alignment: Alignment.center,
        color: Colors.white,
        child: OutlineButton(
          onPressed: () {
            Navigator.of(context).pushNamed(
                '/tried_trucks'
            );
          },
          borderSide: BorderSide(
            color: Colors.teal,
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
                  ImageIcon(
                    AssetImage('assets/images/triedTruck.png'),
                    color: Colors.lime[600],
                  ),
                  SizedBox(width: 5.0),
                  Text('Saved Trucks'),
                ]
            ),
          ),
        )
    );
  }

  Widget _settingButton() {
    return Container(
        width: 225.0,
        height: 50.0,
        alignment: Alignment.center,
        color: Colors.white,
        child: OutlineButton(
          onPressed: () {
            Navigator.of(context).pushNamed(
                '/settings'
            );
          },
          borderSide: BorderSide(
            color: Colors.teal,
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
                    Icons.settings,
                    color: Colors.black,
                  ),
                  SizedBox(width: 5.0),
                  Text('Settings'),
                ]
            ),
          ),
        )
    );
  }



  Widget _logoutButton() {
    return Container(
      width: 225.0,
      height: 50.0,
      alignment: Alignment.center,
      color: Colors.white,
        child: ElevatedButton(
          onPressed: () {
    showAlertDialog(context);
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.teal),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          ),
          child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: 8.8,
              horizontal: 71.0,
            ),
              child:
                const Text('Log out', style: TextStyle(fontSize: 15)),
          ),
        )
    );
  }

  showAlertDialog(BuildContext context) {

    // set up the buttons
    Widget cancelButton = FlatButton(
      child: Text("No"),
      onPressed:  () {
        Navigator.of(context).pop();
      },
    );
    Widget continueButton = FlatButton(
      child: Text("Yes"),
      onPressed:  () {
        Navigator.of(context).pushNamed(
         '/'
        );
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Confirmation"),
      content: Text("Are you sure you would like to log out of WanderTruck?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
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
                      SizedBox(height: 50.0),
                      _profileIcon(),
                      SizedBox(height: 10.0),
                      _userName(),
                      SizedBox(height: 25.0),
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
    // Container(
    //   alignment: Alignment.topRight,
    //   padding: EdgeInsets.all(12.0),
    //   child: Stack(
    //     children: <Widget>[
    //       Image.asset(
    //         'assets/images/logo.png',
    //         width: 200.0,
    //         semanticLabel: 'logo',
    //       )
    //   ],
    //   )
    // ),
          ]
      ),
    );
  }
}