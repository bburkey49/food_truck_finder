import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _ForgotPassword();
  }
}


class _ForgotPassword extends State<ForgotPassword> {

  Widget _haveVerificationCode() {
    return Container(
      alignment: Alignment.bottomCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Text(
            "Have your verification code?",
            style: TextStyle(fontSize: 16.0),
          ),
          FlatButton(
            textColor: Colors.redAccent,
            child: Text(
              'Enter it here',
              style: TextStyle(fontSize: 16.0),
            ),
            onPressed: () {
              sendVerCode(context);
            },
          ),
        ],
      ),
    );
  }

  sendVerCode(BuildContext context){
    Widget enterButton = FlatButton (
        child: Text('Enter'),
        onPressed: () {
          passReset(context);
        }
    );

    Widget cancelButton = FlatButton (
        child: Text('Cancel'),
        onPressed: () {
          Navigator.of(context).pop();
        }
    );

    AlertDialog verCode = AlertDialog(
      title: Text('Enter Verification Code'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(height: 10.0),
          TextField(
          decoration: InputDecoration(
            icon: Icon(
              Icons.verified,
              color: Colors.redAccent,
            ),
            hintText: 'Enter your code here',
          ),
        ),
        ],
      ),
      actions: [
        enterButton,
        cancelButton,
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context){
        return verCode;
      },
    );
  }

  passReset(BuildContext context){
    Widget enterButton = FlatButton (
        child: Text('Enter'),
        onPressed: () {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        }
    );

    Widget cancelButton = FlatButton (
        child: Text('Cancel'),
        onPressed: () {
          Navigator.of(context).pop();
        }
    );

    AlertDialog passwordReset = AlertDialog(
      title: Text('Reset Your Password'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(height: 10),
          TextFormField(
            obscureText: true,
            decoration: InputDecoration(
              icon: Icon(
                Icons.lock,
                color: Colors.redAccent,
              ),
              hintText: "Enter New Password",

            ),
          ),
          SizedBox(height: 20),
          TextFormField(
            obscureText: true,
            decoration: InputDecoration(
              icon: Icon(
                Icons.lock,
                color: Colors.redAccent,
              ),
              hintText: "Reenter New Password",
            ),
          ),
        ],
      ),
      // content: TextField(
      //   decoration: InputDecoration(
      //     border: InputBorder.none,
      //     hintText: 'New Password',
      //   ),
      // ),
      actions: [
        enterButton,
        cancelButton,
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context){
        return passwordReset;
      },
    );
  }


    Widget _buildEmail() {
      return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[

            Text(
                'Email'
            ),
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
                          SizedBox(height: 200.0),
                          Text('Please enter your email and we will send you a verification code.',
                            style: TextStyle(fontWeight: FontWeight.w300, fontSize: 18.0),),
                          SizedBox(height: 30.0),
                          _buildEmail(),
                          SizedBox(height: 15.0),
                          _buildSendButton(),
                        ],
                      )
                  )
              ),
              Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      _haveVerificationCode(),
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
            ],
          )
      );
    }
  }