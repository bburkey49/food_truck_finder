import 'package:flutter/material.dart';

class Login extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _LoginState();
  }
}


class _LoginState extends State<Login> {
  Widget _logo() {

    return Image.asset(
    'assets/images/logo.png',
      alignment: Alignment.topCenter,
      semanticLabel: 'logo',
    );
  }

  Widget _buildEmail() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[

          Text(
              'Email'
          ),
          SizedBox(height: 5.0),
          Container(
              alignment: Alignment.centerLeft,
              height: 60.0,
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(
                    color: Colors.black
                ),
                decoration: InputDecoration(
                    enabledBorder: new OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.redAccent),
                      borderRadius: const BorderRadius.all(
                          const Radius.circular(10.0)
                      ),
                    ),
                    contentPadding: EdgeInsets.only(top: 14.0),
                    prefixIcon: Icon(
                      Icons.email,
                      color: Colors.redAccent,
                    ),
                    hintText: 'Enter your email'
                ),
              )
          ),
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
          SizedBox(height: 5.0),
          Container(
              alignment: Alignment.centerLeft,
              height: 60.0,
              child: TextField(
                obscureText: true,
                keyboardType: TextInputType.visiblePassword,
                style: TextStyle(
                    color: Colors.black
                ),
                decoration: InputDecoration(
                    enabledBorder: new OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.redAccent),
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(10.0)
                      ),
                    ),
                    contentPadding: EdgeInsets.only(top: 14.0),
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Colors.redAccent,
                    ),
                    hintText: 'Enter your password'
                ),
              )
          ),

        ]
    );

  }

  Widget _forgotPassword() {
    return Container(
      alignment: Alignment.centerRight,
      child: FlatButton(
        onPressed: () {
          Navigator.of(context).pushNamed(
              '/forgot_password'
          );
        },
        padding: EdgeInsets.only(right: 0.0),
        child: Text(
          'Forgot Password?',
          style: TextStyle(
            decoration: TextDecoration.underline,
          ),
        )
      )
    );
  }

  Widget _buildLoginButton() {
    return FloatingActionButton(
      backgroundColor: Colors.teal,
      onPressed: () {
        Navigator.of(context).pushNamed(
            '/home'
        );
      },
      child: Text(
        'Login',

      ),
    );
  }

  Widget _newUserButton() {
    return Container(
      alignment: Alignment.bottomLeft,
      child: FlatButton(
        onPressed: () {
          Navigator.of(context).pushNamed(
            '/sign_up'
          );
        },
        child: Text(
          'New User? Sign Up!',
          style: TextStyle(
            decoration: TextDecoration.underline,
          ),
        )
      )
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
              color: Colors.white,
            ),
          ),
          Container(
            height: double.infinity,
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(
                horizontal: 40.0,
                vertical: 40.0
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _logo(),
                  SizedBox(height: 125.0),
                  _buildEmail(),
                  SizedBox(height: 12.0),
                  _buildPassword(),
                  _forgotPassword(),
                  SizedBox(height: 5.0),
                  _buildLoginButton(),
                ],
              )
            )
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                _newUserButton()
              ],
            )

          )
        ],
      )
    );
  }

}


