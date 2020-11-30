import 'package:flutter/material.dart';

class DietaryWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DietaryWidget();
  }
}

class _DietaryWidget extends State<DietaryWidget> {
  List<bool> checked = [false, false, false, false];
  List<String> dr = ['Gluten-Free', 'Vegetarian', 'Vegan', 'Kosher'];

  Widget _dietaryIcon() {
    return Container(
      alignment: Alignment.center,
      child: Icon(Icons.no_food, size: 150, color: Colors.teal,
      ),
    );
  }

  Widget _dietaryTitle() {
    return Container(
      alignment: Alignment.center,
      child: Container(
          child: Stack(
            children: <Widget>[
              Text(
                'Manage Dietary Settings',
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.teal
                ),
              ),
            ],
          )
      ),
    );
  }

  Widget _checks(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
            for (var i = 0; i < 4; i += 1)
              Row(
                children: [
                  Checkbox(
                    onChanged: i == 4 ? null : (bool value) {
                      setState(() {
                        checked[i] = value;
                      });
                    },
                    value: checked[i],
                    activeColor: Colors.teal,
                  ),
                  Text(
                    '${dr[i]}',
                  ),
                ],
              ),
          ],
    );
  }
  Widget _checkBoxes() {
    bool _checked = false;
    return Container(
        alignment: Alignment.center,
       child: Column(
          children: <Widget>[
              CheckboxListTile(
                title: Text("Gluten-Free"),
                controlAffinity:
                ListTileControlAffinity.platform,
                value: _checked,
                onChanged: (bool value){
                  setState(() {
                    _checked = value;
                  });
                },
                activeColor: Colors.teal,
                checkColor: Colors.white,
              ),
            SizedBox(height: 15.0),

            CheckboxListTile(
                title: Text("Vegan"),
                controlAffinity:
                ListTileControlAffinity.platform,
                value: _checked,
                onChanged: (bool value){
                  setState(() {
                    _checked = value;
                  });
                },
                activeColor: Colors.teal,
                checkColor: Colors.white,
              ),
            SizedBox(height: 15.0),

                CheckboxListTile(
                 title: Text("Vegetarian"),
                  controlAffinity: ListTileControlAffinity.platform,
                  value: _checked,
                  onChanged: (bool value){
                   setState(() {
                     _checked = value;
                   });
                   },
                  activeColor: Colors.teal,
                  checkColor: Colors.white,
                ),
            SizedBox(height: 15.0),

            CheckboxListTile(
                  title: Text("Kosher"),
                  controlAffinity: ListTileControlAffinity.platform,
                  value: _checked,
                  onChanged: (bool value){
                    setState(() {
                      _checked = value;
                    });
                    },
                  activeColor: Colors.teal,
                  checkColor: Colors.white,
                )
              ]
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
                        SizedBox(height: 110.0),
                        _dietaryIcon(),
                        SizedBox(height: 15.0),
                        _dietaryTitle(),
                        SizedBox(height: 15.0),
                        _checks(),
                        SizedBox(height: 15.0),
                        FloatingActionButton.extended(
                          backgroundColor: Colors.teal,
                          onPressed: () {
                            Navigator.of(context).pushNamed(
                                '/settings'
                            );
                          },
                          label: Text("Save"),
                        ),
                        SizedBox(height: 15.0),
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
      ),
    );
  }
}