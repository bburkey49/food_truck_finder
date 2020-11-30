import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:food_truck_finder/search_b.dart';
import 'package:food_truck_finder/truck.dart';

// import 'data_search.dart';
import 'package:filter_list/filter_list.dart';
import 'package:food_truck_finder/truck_info_page.dart';


class ListViewPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ListViewState();


}

class _ListViewState extends State<ListViewPage> {
  bool filters = false;

  int price = 10;
  var _currentPriceSelected;
  var _currentStarSelected;
  var _currentFoodSelected;


  Widget _priceFilter() {
    var _prices = ["\$", "\$\$", "\$\$\$"];
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(
            color: Colors.teal, style: BorderStyle.solid, width: 1.5),
      ),
      child: DropdownButton<String>(
        underline: SizedBox.shrink(),
        items: _prices.map((String_dropDownStringItem) {
          return DropdownMenuItem<String>(
            value: String_dropDownStringItem,
            child: Text(String_dropDownStringItem),
          );
        }).toList(),
        onChanged:  (String newValueSelected ) {
          setState(() {
             _currentPriceSelected = newValueSelected;
          });
        },
        value:  _currentPriceSelected,
        hint: Align(
          alignment: Alignment.center,
          child: Text(
            "\$",
            style: TextStyle(color: Colors.teal),
          ),
        ),
        style:
              TextStyle(color: Colors.black, decorationColor: Colors.red),
      ),
    );
  }

  Widget _foodTypeFilter() {
    var _foods = ["American", "Italian", "Mexican", "Vegan"];

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(
            color: Colors.teal, style: BorderStyle.solid, width: 1.5),
      ),
      child: DropdownButton<String>(
        underline: SizedBox.shrink(),
        items: _foods.map((String_dropDownStringItem) {
          return DropdownMenuItem<String>(
            value: String_dropDownStringItem,
            child: Text(String_dropDownStringItem),
          );
        }).toList(),

        onChanged:  (String newValueSelected ) {
          setState(() {
             _currentFoodSelected = newValueSelected;
          });
        },
        value:  _currentFoodSelected,
        hint: Align(
          alignment: Alignment.center,
          child: Text(
            "Food Type",
            style: TextStyle(color: Colors.teal),
          ),
        ),
        style:
              TextStyle(color: Colors.black, decorationColor: Colors.red),
      ),
    );
  }

  Widget _reviewFilter() {
    var _reviews = ["1+", "2+", "3+", "4+", "5"];

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(
            color: Colors.teal, style: BorderStyle.solid, width: 1.5),
      ),
      child: DropdownButton<String>(
        underline: SizedBox.shrink(),
        items: _reviews.map((String_dropDownStringItem) {
          return DropdownMenuItem<String>(
            value: String_dropDownStringItem,
            child: Text(String_dropDownStringItem),
          );
        }).toList(),

        onChanged:  (String newValueSelected ) {
          setState(() {
             _currentStarSelected = newValueSelected;
          });
        },
        value:  _currentStarSelected,
        hint: Align(
          alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const <Widget>[
                Icon(
                  Icons.star,
                  color: Colors.teal,
                  size: 10.0,
                  semanticLabel: 'star rating',
                ),
                Icon(
                  Icons.star,
                  color: Colors.teal,
                  size: 10.0,
                ),
                Icon(
                  Icons.star,
                  color: Colors.teal,
                  size: 10.0,
                ),
                Icon(
                  Icons.star,
                  color: Colors.teal,
                  size: 10.0,
                ),Icon(
                  Icons.star,
                  color: Colors.teal,
                  size: 10.0,
                ),

              ],
            )
        ),
        style:
              TextStyle(color: Colors.black, decorationColor: Colors.red),
      ),
    );
  }
  Widget _setFilters() {
    return Container(
      child: Ink(
          decoration: const ShapeDecoration(
            color: Colors.white,
            shape: CircleBorder(),
          ),
        child: IconButton(
          icon: Icon(Icons.check),
          color: Colors.teal,
          onPressed: onFilterChanged,
        ),
      ),
    );
  }

  TextEditingController _textController = TextEditingController();
  List<Truck> _trucks = [];
  bool loaded = false;

  // Future<String> loadAsset(BuildContext context) {
  //   return DefaultAssetBundle.of(context).loadString('assets/data/trucks.json');
  // }

  _getTrucks(String json) {
    List<dynamic> rawTrucks = jsonDecode(json) as List;

    rawTrucks.forEach((element) {
      setState(() {
        _trucks.add(Truck.fromJson(element));
        prospectiveTrucks = List.from(_trucks);
      });
    });
  }


  List<Truck> prospectiveTrucks = [];

   onItemChanged(String value) {
    setState(() {
      prospectiveTrucks = _trucks
          .where((t) => t.name.toLowerCase().contains(value.toLowerCase())).toList();
    });
  }

  onFilterChanged() {
    setState(() {
      if(_currentFoodSelected != null) {
        prospectiveTrucks = _trucks
          .where((t) => t.foodType.contains(_currentFoodSelected)).toList();
      }
      else if(_currentStarSelected != null) {
        prospectiveTrucks = _trucks
          .where((t) => t.rating >= _currentStarSelected.length).toList();
      }
      else if(_currentPriceSelected != null) {
        prospectiveTrucks = _trucks
          .where((t) => t.price.length <= _currentPriceSelected.length).toList();
      }
      });

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


  @override
  Widget build(BuildContext context) {
    Future<String> fileName = Future<String>.sync(() {
      return DefaultAssetBundle.of(context).loadString(
          'assets/data/trucks.json');
    });
    fileName.then((fN) {
      if (!loaded) {
        setState(() {
          _getTrucks(fN);
          loaded = true;
        });
      }
    });

    return Scaffold(
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 12, 30, 12.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _textController,
                    decoration: InputDecoration(
                      isDense: true,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.teal, width: 1.5),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      hintText: 'Search',
                      hintStyle: TextStyle(color: Colors.teal),
                      suffixIcon: IconButton(
                        icon: Icon(Icons.search),
                        // onPressed: onFilterChanged,
                        color: Colors.teal,
                      ),
                    ),
                    onChanged: onItemChanged,

                  ),
                ),
              ],
            ),
          ),
          buildFilters(),
          Expanded(
            child: ListView(
                padding: EdgeInsets.all(12.0),
                children: List<Widget>.generate(
                    prospectiveTrucks.length,
                        (index) => _buildBlock(context, prospectiveTrucks[index])
                )
            )
          )
        ],
      ),
    );
    // return Scaffold(
    //
    //   appBar: AppBar(
    //     title:
    //     TextField(
    //       //controller: TextEditingController(),
    //       decoration: InputDecoration(
    //           hintText: 'Search'
    //       ),
    //       onTap: () {
    //         showSearch(context: context, delegate: DataSearch());
    //       }
    //     ),
    //     leading: IconButton(
    //       icon: Icon(Icons.arrow_left),
    //       onPressed: () { },
    //     ),
    //     actions: <Widget>[
    //       IconButton(
    //           icon: Icon(Icons.filter),
    //           onPressed: () {
    //             Navigator.of(context).pushNamed(
    //               '/filters'
    //             );
    //           }
    //       ),
    //       IconButton(
    //           icon: Icon(Icons.search),
    //           onPressed: () { }
    //       )
    //     ],
    //   ),
    //   body: ListView(
    //           scrollDirection: Axis.vertical,
    //           children: <Widget>[
    //             _buildBlock(),
    //             _buildBlock(),
    //             _buildBlock(),
    //             _buildBlock(),
    //             _buildBlock(),
    //             _buildBlock()
    //           ],
    //         )
    // );
  }

  Container buildFilters() {
    return Container(
      alignment: Alignment.center,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(width: 30.0),
          _priceFilter(),
          SizedBox(width: 15.0),
          _foodTypeFilter(),
          SizedBox(width: 15.0),
          _reviewFilter(),
          SizedBox(width: 15.0),
          _setFilters(),
        ],
      ),
    );
  }
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


