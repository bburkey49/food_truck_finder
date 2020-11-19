import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SignUp();
  }
}


class _SignUp extends State<SignUp> {
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
                  children: <Widget>[
                    SizedBox(height: 60),
                    Text('Register',
                      style: TextStyle(fontWeight: FontWeight.w700, fontSize: 30.0),
                    ),
                    SizedBox(height: 40),
                    TextField(
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.person,
                        ),
                        hintText: 'First Name'
                      )
                    ),
                    SizedBox(height: 15),
                    TextField(
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.person,
                        ),
                        hintText: 'Last Name'
                      )
                    ),
                    SizedBox(height: 15),
                    TextField(
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.person,
                        ),
                        hintText: 'Username'
                      )
                    ),
                    SizedBox(height: 15),
                    TextField(
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.email
                        ),
                        hintText: 'Email Address'
                      )
                    ),
                    SizedBox(height: 15),
                    TextField(
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.lock,
                        ),
                        hintText: 'Password'
                      )
                    ),
                    SizedBox(height: 20),
                    TextField(
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.lock,
                        ),
                        hintText: 'Confirm Password'
                      )
                    ),
                    SizedBox(height: 15),
                    RaisedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(
                           '/home'
                        );
                      },
                      child: Text('Sign Up'),
                      color: Colors.red,
                    ),
                    SizedBox(height: 100),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Already have an account?",
                          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 18.0),
                        ),
                        FlatButton(
                          textColor: Colors.red,
                          child: Text(
                            'Sign In',
                            style: TextStyle(fontSize: 20),
                          ),
                          onPressed: () {
                            Navigator.of(context).pushNamed(
                                '/'
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
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
                color: Colors.black,
                splashColor: Colors.purple,
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