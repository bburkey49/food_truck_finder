import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:food_truck_finder/custom_info_window.dart';
import 'package:food_truck_finder/data_search.dart';
import 'package:food_truck_finder/truck.dart';
// import 'search_b.dart';


class MapPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MapPageState();

}

class _MapPageState extends State<MapPage> {
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
    var _reviews = ["*", "**", "***", "****", "*****"];

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
          .where((t) => t.name.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

    Stream<List<Truck>> get truckSearchStream async* {
      yield prospectiveTrucks;
    }


  bool selected = true;

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
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Container(
          width: 500,
          height: 100,
          alignment: Alignment.centerRight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(14.0, 27.5, 15.0, 0.0),
                child: TextField(
                  controller: _textController,
                  decoration: InputDecoration(
                    isDense: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1.5, color: Colors.teal),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    hintText: 'Search',
                    hintStyle: TextStyle(color: Colors.teal),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.search, color: Colors.teal),
                      //onPressed: onFilterChanged,
                    ),
                  ),
                  onChanged: onItemChanged,
                  onSubmitted: onItemChanged,
                ),
              ),
            ],
          ),
        ),
      ),
        body: Stack(
          children: <Widget>[
            _googleMap(context, _trucks),
            buildFilters(),
            Positioned(child: _mapKey(context), top: 75.0, left: 0.0),
          ]
        )
    );
          // _horizontalContainer()
  }




  Container buildFilters() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
      child: Row(
        children: [
          SizedBox(width: 30.0),
          _priceFilter(),
          SizedBox(width: 25.0),
          _foodTypeFilter(),
          SizedBox(width: 25.0),
          _reviewFilter(),
        ],
      ), 
    );
  }


 /* Widget _mapKey(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40),
        side: BorderSide(
            color: Colors.teal,
            width: 1.0,
        ),
        )
    );
  } */

  Widget _mapKey(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selected = !selected;
        });
      },
      child: _mapKeyContainer(context)
    );
  }

  Widget _mapKeyContainer(BuildContext context) {
    return AnimatedContainer(
      decoration: BoxDecoration(
        borderRadius: selected ? BorderRadius.circular(10) : BorderRadius.circular(3),
        border: Border.all(
          color: Colors.teal,
          width: 1.5,
        ),
        color: selected ? Colors.white : Colors.teal,
      ),
      width: selected ? 150.0 : 37.5,
      height: selected ? 190.0 : 35.0,
      //color: Colors.teal,
      alignment: FractionalOffset(0.0,1.0),
      duration: Duration(seconds: 1),
      curve: Curves.fastOutSlowIn,
      child: selected ? _mapKeyList(context) : Align(child: Icon(Icons.info, color: Colors.white, size: 25.0)),
    );
}

  Widget _mapKeyList(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(0.5),
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(15.0, 5.0, 0, 0),
              child: Text(
                'Key',
              style: TextStyle(color: Colors.teal, fontWeight: FontWeight.bold, fontSize: 20.0),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0,5.0,10.0,0),
              child: Icon(Icons.arrow_left, color: Colors.teal, size: 25.0),),
          ],

        ),
        Container(
            height:45.0,
            child: Card(
              elevation: 0,
               child: ListTile(
                 leading: Image(image: AssetImage('assets/images/triedTruck.png'), height: 25.0, width: 30.0),
                 title: Text('Saved'),
          ),
        )),
        Container(
            height:45.0,
            child: Card(
              elevation: 0,
              child: ListTile(
                 leading: Image(image: AssetImage('assets/images/savedTruck.png'), height: 25.0, width: 30.0),
                title: Text('Tried'),
          ),
        )),
        Container(
            height:45.0,
            child: Card(
              elevation: 0,
              child: ListTile(
                leading: Image(image: AssetImage('assets/images/newTruck.png'), height: 25.0, width: 30.0),
                title: Text('New'),
          ),
        )),
      ]
    );
  }

  Widget _googleMap(BuildContext context, List<Truck> trucks) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: CustomInfoWindow(trucks: trucks)
    );
  }

}