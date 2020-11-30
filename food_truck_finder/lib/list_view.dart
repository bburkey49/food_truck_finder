import 'dart:convert';

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
      child: DropdownButton<String>(
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
            style: TextStyle(color: Colors.black),
          ),
        ),
        style:
              TextStyle(color: Colors.black, decorationColor: Colors.red),
      ),
    );
  }

  Widget _foodTypeFilter() {
    var _foods = ["Mexican", "Italian", "American", "Vegan"];

    return Container(
      child: DropdownButton<String>(
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
            style: TextStyle(color: Colors.black),
          ),
        ),
        style:
              TextStyle(color: Colors.black, decorationColor: Colors.red),
      ),
    );
  }

  Widget _reviewFilter() {
    var _reviews = ["*", "**", "***", "****", "*****"];

    return Container(
      // color: Colors.teal,
      child: DropdownButton<String>(
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
          child: Text(
            "*****",
            style: TextStyle(color: Colors.black),
          ),
        ),
        style:
              TextStyle(color: Colors.black, decorationColor: Colors.red),
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
      // else {
      //    prospectiveTrucks = _trucks
      //    .where((t) => t.name.toLowerCase().contains(value.toLowerCase()))
      //     .toList();
      // }
    });
  }

  Widget _buildBlock(BuildContext context, Truck truck) {
    return ElevatedButton(

      style: ButtonStyle(
          overlayColor: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                if (states.contains(MaterialState.hovered))
                  return Colors.teal;
                return null;
              }
          )
      ),
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => TruckInfo(truck: truck))
        );
      },
      child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
              child: FittedBox(
                child: Material(
                  color: Colors.white,
                  elevation: 14.0,
                  borderRadius: BorderRadius.circular(24.0),
                  shadowColor: Colors.grey[600],
                  child:
                  Row(
                    children: <Widget>[
                      Container(
                          child: myDetailsContainer(truck)
                      ),
                      Container(
                          height: 250,
                          width: 250,
                          child: ClipRRect(
                              borderRadius: new BorderRadius.circular(24.0),
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
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 4,
                  child: TextField(
                    controller: _textController,
                    decoration: InputDecoration(
                      hintText: 'Search',
                      // fillColor: Colors.teal,
                    ),
                    onChanged: onItemChanged,
                  ),
                ),
                Flexible(
                  child: IconButton(
                    icon: Padding(
                      padding: const EdgeInsets.all(1),
                      child: Icon(Icons.search),
                    ),
                    onPressed: () {}
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
            ),
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
      color: Colors.teal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          //SizedBox(width: 50.0),
          Flexible(child: _priceFilter()),
          //SizedBox(width: 50.0),
          Flexible(child: _foodTypeFilter()),
          //SizedBox(width: 50.0),
          Flexible(child: _reviewFilter()),
          //SizedBox(width: 50.0),
          Flexible(
            child: IconButton(
                icon: Padding(
                  padding: const EdgeInsets.all(1),
                  child: Icon(Icons.filter_list),
                ),
                onPressed: () => onFilterChanged()
            ),
          ),
        ],
      ),
    );
  }

}


  Widget myDetailsContainer(Truck truck) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(
              child: Text(truck.name,
                style: TextStyle(color: Colors.redAccent,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold),)),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(child: Text(truck.rating.toStringAsFixed(1),
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
        Container(child: Text("${truck.foodType} \u00B7 Minneapolis, MN",
          style: TextStyle(color: Colors.black,
              fontSize: 18.0,
              fontWeight: FontWeight.bold),)),
      ],
    );
  }


