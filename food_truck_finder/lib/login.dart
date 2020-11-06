import 'package:flutter/material.dart';

class Login extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _LoginState();
  }
}


class _LoginState extends State<Login> {

  Widget _buildEmail() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
              'Email'
          ),
          SizedBox(height: 10.0),
          Container(
              alignment: Alignment.centerLeft,
              height: 60.0,
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(
                    color: Colors.white
                ),
                decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(top: 14.0),
                    prefixIcon: Icon(
                      Icons.email,
                      color: Colors.white,
                    ),
                    hintText: 'Enter your email'
                ),
              )
          )
        ]
    );

  }

  Widget _buildPassword() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
              'Password'
          ),
          SizedBox(height: 10.0),
          Container(
              alignment: Alignment.centerLeft,
              height: 60.0,
              child: TextField(
                obscureText: true,
                keyboardType: TextInputType.visiblePassword,
                style: TextStyle(
                    color: Colors.white
                ),
                decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(top: 14.0),
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Colors.white,
                    ),
                    hintText: 'Enter your password'
                ),
              )
          )
        ]
    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.orange,
                  Colors.red
                ]
              )
            ),
          ),
          Container(
            height: double.infinity,
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(
                horizontal: 40.0,
                vertical: 120.0
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Sign In',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'OpenSans',
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold
                    )
                  ),
                  SizedBox(height: 30.0),
                  _buildEmail(),
                  SizedBox(height: 5.0),
                  _buildPassword(),
                ],
              )
            )
          )
        ],
      )
    );
  }

}


