import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _ForgotPassword();
  }
}


class _ForgotPassword extends State<ForgotPassword> {
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

  Widget _buildSendButton() {
    return FloatingActionButton(
      backgroundColor: Colors.teal,
      onPressed: () {
        showAlertDialog(context);
      },
      child: Text(
        'Send',

      ),
    );
  }

  showAlertDialog(BuildContext context) {

    // set up the buttons
    Widget cancelButton = FlatButton(
      child: Text("Ok"),
      onPressed:  () {
        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Email Sent"),
      content: Text("Please check your email for your verification code."),
      actions: [
        cancelButton,
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
                          SizedBox(height: 15.0),
                          _logo(),
                          SizedBox(height: 110.0),
                          Text('Please enter your email and we will send you a verification code.',
                            style: TextStyle(fontWeight: FontWeight.w300, fontSize: 18.0),),
                          SizedBox(height: 30.0),
                          _buildEmail(),
                          SizedBox(height: 5.0),
                          _buildSendButton(),
                          SizedBox(height: 50.0),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "Have your verification code?",
                                style: TextStyle(fontWeight: FontWeight.w300, fontSize: 18.0),
                              ),
                              FlatButton(
                                textColor: Colors.red,
                                child: Text(
                                  'Click Me!',
                                  style: TextStyle(fontSize: 20),
                                ),
                                onPressed: () {
                                },
                              ),
                            ],
                          ),
                        ],
                      )
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
                  color: Colors.black,
                  splashColor: Colors.purple,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          )
      );
    }
  }