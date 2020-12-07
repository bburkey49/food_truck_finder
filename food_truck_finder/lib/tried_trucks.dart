import 'package:flutter/material.dart';
import 'globals.dart';
import 'package:food_truck_finder/truck.dart';
import 'package:food_truck_finder/truck_info_page.dart';

class TriedTrucksWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TriedTrucksWidget();
  }
}

Widget _truck() {

  return Image.asset(
    'assets/images/triedTruck.png',
    color: Colors.lime[600],
    width: 200.0,
    alignment: Alignment.topCenter,
    semanticLabel: 'saved truck icon',
  );
}

Widget _triedTrucksTitle() {
  return Container(
      alignment: Alignment.center,
      child: Column(
          children: <Widget>[
            Text(
                'Saved Trucks',
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.teal,
                )
            )
          ]
      )
  );
}

class _TriedTrucksWidget extends State<TriedTrucksWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          children: <Widget>[
            Container(
              //alignment: Alignment.topRight,
                padding: EdgeInsets.only(
                  left: 20.0,
                  right: 20.0,
                  top: 40.0,
                  bottom: 0.0,
                ),
                child: Row(
                    children: <Widget>[
                      IconButton(
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
                      SizedBox(width: 80.0),
                      Expanded(
                        child: Image.asset(
                          'assets/images/logo.png',
                          width: 200.0,
                        ),
                      )
                    ]
                )
            ),
            Container(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    _truck(),
                    _triedTrucksTitle()
                  ],
                )
            ),
            Expanded(
                child: ListView(
                    padding: EdgeInsets.all(12.0),
                    children: List<Widget>.generate(
                        visitedTrucks.length,
                            (index) =>
                            _buildBlock(context, visitedTrucks[index])
                    )
                )
            ),
          ]
      ),
    );
  }
}

Widget _buildBlock(BuildContext context, Truck truck) {
  return FlatButton(
    onPressed: () {
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => TruckInfo(truck: truck))
      );
    },
    child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
            child: FittedBox(
              child: Container(
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 2.5, color: Colors.teal),
                  ),
                ),
                child: Row(
                  children: <Widget>[
                    Container(
                        child: myDetailsContainer(truck)
                    ),
                    Container(
                        height: 250,
                        width: 250,
                        child: ClipRRect(
                            child: Image(
                                fit: BoxFit.contain,
                                alignment: Alignment.topRight,
                                image: AssetImage(
                                    'assets/images/other_candy_truck.jpg')
                            )
                        )
                    )
                  ],
                ),
              ),
            )
        )
    ),
  );
}

Widget myDetailsContainer(Truck truck) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(left: 15.0),
        child: Container(
            child: Text(truck.name,
              style: TextStyle(color: Colors.redAccent,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold),)),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 15.0),
        child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                    child: Text(
                      truck.rating.toStringAsFixed(1),
                      style: TextStyle(color: Colors.black54, fontSize: 18.0,),)),
                IconTheme(
                  data: IconThemeData(color: Colors.redAccent,),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(
                      5, // length
                          (index) {
                        return Icon(
                          index < truck.rating
                              ? Icons.star
                              : Icons.star_border,
                        );
                      },
                    ),
                  ),
                ),
              ],)),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 15.0),
        child: Container(
            child: Text("${truck.foodType} \u00B7 Minneapolis",
              style: TextStyle(color: Colors.black,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold),)),),
    ],
  );
}