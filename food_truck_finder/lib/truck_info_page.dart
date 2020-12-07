import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:food_truck_finder/truck.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'globals.dart';

class TruckInfo extends StatefulWidget {

  TruckInfo({
    this.truck,
  });

  final Truck truck;

  @override
  State<StatefulWidget> createState() {
    return _TruckInfoState(this.truck);
  }
}


class _TruckInfoState extends State<TruckInfo> {
  String personalizedTruck = 'New';
  Color truckCol = Colors.grey;

  final LatLng _center = LatLng(44.9778, -93.2650);

  Truck truck;
  
  bool visited;
  bool liked;


  _TruckInfoState(Truck truck) {
    this.truck = truck;
  }

  Widget _personalizedTruck() {
    return Container(
        alignment: Alignment.centerLeft,
        child: Row(
          children: <Widget>[
            _truckButtons(),
            // ImageIcon(
            //     AssetImage('assets/images/triedTruck.png'),
            //     color: truckCol,
            //     size: 30.0,
            // ),
            // SizedBox(width: 20),
            // _dropdown(),
          ]
        )
    );
  }

  @override
  void initState() {
    super.initState();
    visited = visitedTrucks.map((t) => t.name.toLowerCase()).toList().contains(this.truck.name.toLowerCase());
    liked = likedTrucks.map((t) => t.name.toLowerCase()).toList().contains(this.truck.name.toLowerCase());
    truckCol = visited ? Colors.lime[600] : Colors.grey[800];

  }
  
  

  Widget _truckButtons() {
    return Container(
        child: Row(
            children: <Widget>[
              IconButton(
                  icon: ImageIcon(
                    AssetImage('assets/images/triedTruck.png'),
                    color: truckCol,
                    size: 30.0,
                  ),
                  onPressed: () {
                    bool prospVisited;
                    Color color;
                    if (visited) {
                      visitedTrucks.remove(visitedTrucks.firstWhere((t) => t.name.toLowerCase() == this.truck.name.toLowerCase()));
                      prospVisited = false;
                    }
                    else {
                      visitedTrucks.add(this.truck);
                      prospVisited = true;

                    }
                    setState(() {
                      visited = prospVisited;
                      truckCol = visited ? Colors.yellow[600] : Colors.grey[800];
                    });
                  }
              ),
              IconButton(
                icon: Icon(
                  liked ? Icons.favorite : Icons.favorite_border_rounded,
                  color: Colors.red[700],
                  size: 30.0
                ),
                onPressed: () {
                  bool prospLiked;
                  if (liked) {
                    likedTrucks.remove(likedTrucks.firstWhere((t) => t.name.toLowerCase() == this.truck.name.toLowerCase()));
                    prospLiked = false;
                  }
                  else {
                    likedTrucks.add(this.truck);
                    prospLiked = true;

                  }
                  setState(() {
                    liked = prospLiked;
                  });
                },
              ),
            ]
        )
    );
  }
    

  Widget _dropdown() {
    var _truckCategories = ["New", "Visited", "Liked"];

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
            if(newValueSelected == "Visited"){
              truckCol = Colors.lime[600];
              if(!visitedTrucks.any((element) => element.name == truck.name)){
                visitedTrucks.add(truck);
              }
              for(int i = 0; i < likedTrucks.length; i++){
                if(likedTrucks[i].name == truck.name){
                  likedTrucks.remove(likedTrucks[i]);
                }
              }
            }
            if (newValueSelected == "Liked"){
              truckCol = Colors.redAccent;
              if(!likedTrucks.any((element) => element.name == truck.name)){
                likedTrucks.add(truck);
              }
              for(int i = 0; i < visitedTrucks.length; i++){
                if(visitedTrucks[i].name == truck.name){
                  visitedTrucks.remove(visitedTrucks[i]);
                }
              }

            }
            if (newValueSelected == "New"){
              truckCol = Colors.grey[800];
              for(int i = 0; i < likedTrucks.length; i++){
                if(likedTrucks[i].name == truck.name){
                  likedTrucks.remove(likedTrucks[i]);
                }
              }
              for(int i = 0; i < visitedTrucks.length; i++){
                if(visitedTrucks[i].name == truck.name){
                  visitedTrucks.remove(visitedTrucks[i]);
                }
              }
            }
          });
        },

        value:  personalizedTruck,

      ),
    );
  }

  Widget _nameOfTruck(Truck truck) {
    return Container(
        alignment: Alignment.centerLeft,
        child: Row(
            children: <Widget>[
              Text(
                truck.name,
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'OpenSans',
                ),
              ),
              Expanded(
                  child: Text(
                    truck.price,
                    textDirection: TextDirection.ltr,
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'OpenSans',
                    ),
                  ))
            ]
        )
    );
  }

  Widget _typeOfFood(Truck truck) {
    return Container(
        alignment: Alignment.centerLeft,
        child: Row(
            children: <Widget>[
              Text(
                  truck.foodType,
                  style: TextStyle(fontStyle: FontStyle.italic),
              )
            ]
        )
    );
  }

  Widget _starRating(Truck truck) {
    return Container(
        alignment: Alignment.centerLeft,
        child: Row(
            children: List.generate(
              5, // length
                  (index) {
                return Icon(
                  index < truck.rating
                      ? Icons.star
                      : Icons.star_border,
                  size: 40,
                  color: Colors.redAccent,
                );
              },
            )
        )
    );
  }

  Widget _locationWidget(Truck truck) {
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
              Container(
                height: 25.0,
                width: 250.0,
                  child: Text(
                    truck.computeDistance(_center),
                    style: TextStyle(
                      fontSize: 12,
                      fontFamily: 'OpenSans',
                    ),
              )
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
                  'Open until 10pm'
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
                  child: Text(
                      '*menu may vary by day, see food truck for most accurate details',
                      style: TextStyle(
                        fontSize: 10,
                        fontFamily: 'OpenSans',
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
                    child: Text(
                      'A nice and long description of a very scrumptious food item where the length of the description doesnt matter because the code automatically moves this down lines',
                      style: TextStyle(
                        fontSize: 10,
                        fontFamily: 'OpenSans',
                      )
                    )
              )
            ]
        )
    );
  }


  _getTrucks(String json) {
    List<dynamic> rawTrucks = jsonDecode(json) as List;

    rawTrucks.forEach((element) {
      setState(() {
        _trucks.add(Truck.fromJson(element));
      });
    });
  }

  List<Truck> _trucks = [];
  bool loaded = false;

  @override
  Widget build(BuildContext context) {
    // final  Map<String, Truck> truckData = ModalRoute.of(context).settings.arguments;
    // print("hello");
    // print(truckData);
    // print("hello");

    // Truck truck = truckData['truck'];



    // Future<String> fileName = Future<String>.sync(() {
    //   return DefaultAssetBundle.of(context).loadString(
    //       'assets/data/trucks.json');
    // });
    // fileName.then((fN) {
    //   if (!loaded) {
    //     setState(() {
    //       _getTrucks(fN);
    //       loaded = true;
    //     });
    //   }
    // });

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
                          _nameOfTruck(truck),
                          SizedBox(height: 5.0),
                          _typeOfFood(truck),
                          SizedBox(height: 10.0),
                          _starRating(truck),
                          SizedBox(height: 10.0),
                          _locationWidget(truck),
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


