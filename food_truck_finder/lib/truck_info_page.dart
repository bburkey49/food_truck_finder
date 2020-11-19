import 'package:flutter/material.dart';

class TruckInfo extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _TruckInfoState();
  }
}


class _TruckInfoState extends State<TruckInfo> {
  String personalizedTruck = 'New';
  Color truckCol = Colors.grey;

  Widget _personalizedTruck() {
    return Container(
        alignment: Alignment.centerLeft,
        child: Row(
            children: <Widget>[
              ImageIcon(
                  AssetImage('assets/images/triedTruck.png'),
                  color: truckCol,
                  size: 30.0,
              ),
              SizedBox(width: 20),
              _dropdown(),
            ]
        )
    );
  }

  Widget _dropdown() {
    var _truckCategories = ["New", "Tried", "Saved"];

    return Container(
      child: DropdownButton<String>(
        items: _truckCategories.map((String_dropDownStringItem) {
          return DropdownMenuItem<String>(
            value: String_dropDownStringItem,
            child: Text(String_dropDownStringItem),
          );
        }).toList(),

        onChanged:  (String newValueSelected ) {
          setState(() {
            personalizedTruck = newValueSelected;
            if(newValueSelected == "Tried"){
              truckCol = Colors.lime[600];
            }
            if (newValueSelected == "Saved"){
              truckCol = Colors.redAccent;
            }
            if (newValueSelected == "New"){
              truckCol = Colors.grey[800];
            }
          });
        },

        value:  personalizedTruck,

      ),
    );
  }

  Widget _nameOfTruck() {
    return Container(
        alignment: Alignment.centerLeft,
        child: Row(
            children: <Widget>[
              Text(
                'Name Of Food Truck',
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'OpenSans',
                ),
              ),
              SizedBox(width: 60),
              Icon(
                  Icons.attach_money,
                  color: Colors.black,
                  size: 30
              ),
              Icon(
                  Icons.attach_money,
                  color: Colors.black,
                  size: 30
              )
            ]
        )
    );
  }

  Widget _typeOfFood() {
    return Container(
        alignment: Alignment.centerLeft,
        child: Row(
            children: <Widget>[
              Text(
                  'Type of food'
              )
            ]
        )
    );
  }

  Widget _starRating() {
    return Container(
        alignment: Alignment.centerLeft,
        child: Row(
            children: <Widget>[
              Icon(
                  Icons.star,
                  color: Colors.black,
                  size: 40
              ),
              Icon(
                  Icons.star,
                  color: Colors.black,
                  size: 40
              ),
              Icon(
                  Icons.star,
                  color: Colors.black,
                  size: 40
              ),
              Icon(
                  Icons.star,
                  color: Colors.black,
                  size: 40
              )
            ]
        )
    );
  }

  Widget _locationWidget() {
    return Container(
        alignment: Alignment.centerLeft,
        child: Row(
            children: <Widget>[
              Icon(
                Icons.location_on_outlined,
                color: Colors.black,
                size: 25,
              ),
              SizedBox(width: 5),
              Text(
                  'x.x miles away'
              )
            ]
        )
    );
  }

  Widget _openUntil() {
    return Container(
        alignment: Alignment.centerLeft,
        child: Row(
            children: <Widget>[
              Text(
                  'Open until x pm'
              )
            ]
        )
    );
  }

  Widget _picturesWidget() {
    return Container(
        alignment: Alignment.center,
        child: Text('Insert Images'),
        color: Colors.blueGrey,
        padding: EdgeInsets.symmetric(vertical: 90.0, horizontal: 20.0)
    );
  }

  Widget _menuWidget() {
    return Container(
        alignment: Alignment.centerLeft,
        child: Row(
            children: <Widget>[
              Text(
                'MENU*',
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'OpenSans',
                ),
              ),
              SizedBox(width: 30),
              Container(
                height: 25.0,
                width: 200.0,
                child: Flexible(
                  child: Text(
                      '*menu may vary by day, see food truck for most accurate details',
                      style: TextStyle(
                        fontSize: 10,
                        fontFamily: 'OpenSans',
                      )
                  )
                )
              )
            ]
        )
    );
  }


  Widget _menuItems(String item, String cost) {
    return Container(
        alignment: Alignment.centerLeft,
        child: Column(
            children: <Widget>[
              Row(
                  children: <Widget>[
                    Text(
                        item + '.......................................................'
                    ),
                    Icon(
                        Icons.attach_money,
                        color: Colors.black,
                        size: 15
                    ),
                    Text(
                        cost
                    )
                  ]
              ),
              SizedBox(height: 5),
              Container(
                height: 45.0,
                width: 300.0,
                  child: Flexible(
                    child: Text(
                      'A nice and long description of a very scrumptious food item where the length of the description doesnt matter because the code automatically moves this down lines',
                      style: TextStyle(
                        fontSize: 10,
                        fontFamily: 'OpenSans',
                      )
                    )
                  )
              )
            ]
        )
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
                          _personalizedTruck(),
                          SizedBox(height: 10.0),
                          _nameOfTruck(),
                          SizedBox(height: 5.0),
                          _typeOfFood(),
                          SizedBox(height: 10.0),
                          _starRating(),
                          SizedBox(height: 10.0),
                          _locationWidget(),
                          SizedBox(height: 5.0),
                          _openUntil(),
                          SizedBox(height: 20.0),
                          _picturesWidget(),
                          SizedBox(height: 20.0),
                          _menuWidget(),
                          SizedBox(height: 10.0),
                          _menuItems('item 1', '10.00'),
                          _menuItems('item 2', '9.00'),
                          _menuItems('item 3', '10.00'),
                          _menuItems('item 4', '11.00'),
                          _menuItems('item 5', '14.00'),
                          _menuItems('item 6', '9.50'),
                          _menuItems('item 7', '10.00'),
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
        )
    );
  }
}