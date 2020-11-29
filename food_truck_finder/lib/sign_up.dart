import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SignUp();
  }
}


class _SignUp extends State<SignUp> {

  Widget _alreadyUser() {
    return Container(
        alignment: Alignment.bottomLeft,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Text(
              "Already have an account?",
            ),
            FlatButton(
              textColor: Colors.redAccent,
              child: Text(
                'Sign In',
              ),
              onPressed: () {
                Navigator.of(context).pushNamed(
                    '/'
                );
              },
            ),
          ],
        ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      // appBar: new AppBar(
      //   title: Text('Food Truck Finder'),
      //   centerTitle: true,
      // ), 

      body: Stack(
          children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(
              horizontal: 40.0,
              vertical: 30.0
            ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 100),
                    Text('Register',
                      style: TextStyle(fontWeight: FontWeight.w500, fontSize: 25.0, color: Colors.teal),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.person,
                          color: Colors.redAccent,
                        ),
                        hintText: 'First Name'
                      )
                    ),
                    SizedBox(height: 15),
                    TextField(
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.person,
                          color: Colors.redAccent,
                        ),
                        hintText: 'Last Name'
                      )
                    ),
                    SizedBox(height: 15),
                    TextField(
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.person,
                          color: Colors.redAccent,
                        ),
                        hintText: 'Username'
                      )
                    ),
                    SizedBox(height: 15),
                    TextField(
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.email,
                          color: Colors.redAccent,
                        ),
                        hintText: 'Email Address'
                      )
                    ),
                    SizedBox(height: 15),
                    TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                        icon: Icon(
                          Icons.lock,
                          color: Colors.redAccent,
                        ),
                        hintText: 'Password'
                      )
                    ),
                    SizedBox(height: 20),
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.lock,
                          color: Colors.redAccent,
                        ),
                        hintText: 'Confirm Password'
                      )
                    ),
                    SizedBox(height: 20),
                    FloatingActionButton.extended(
                      backgroundColor: Colors.teal,
                      onPressed: () {
                        Navigator.of(context).pushNamed(
                           '/home'
                        );
                      },
                      label: Text("Sign Up"),
                    ),
                    SizedBox(height: 65),
                  ],
                ),
              ),
            ),
          ),
            Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    _alreadyUser(),
                  ],
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
      )
    );
  }
}