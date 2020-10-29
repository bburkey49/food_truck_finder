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
      backgroundColor: Colors.white,
      appBar: new AppBar(
        title: Text('Food Truck Finder'),
        centerTitle: true,
      ), 

      body: Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        padding: EdgeInsets.all(25),
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(height: 10),
              Text('Register',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 30.0),
               ),
              SizedBox(height: 60),
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
                  hintText: 'Email Adress'
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
                onPressed: () {},
                child: Text('Sign Up'),
                color: Colors.red,
              ),
              SizedBox(height: 120),
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
                          //Sign In
                        },
                  ),
                ],            
              ),
            ],
          ),
        ),
      ),
    );
  }
}