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
    var _currentPriceSelected = "\$";
    var _currentStarSelected = "*****";
    var _currentFoodSelected = "Mexican";
    

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
      ),
    );
  }

  Widget _foodTypeFilter() { 
    var _foods = ["Mexican", "Italian", "American"];

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
        title: Container(
          width: 500,
          height: 75,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextField(
                  controller: _textController,
                  decoration: InputDecoration(
                    hintText: 'Search',
                    // fillColor: Colors.teal,
                  ),
                  onChanged: onItemChanged,
                  onSubmitted: onItemChanged,
                ),
              ),
            ],
          ),
        ),
        automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(
            color: Colors.black,
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: DataSearch());
            }
          )
        ],
      ),
        body: Stack(
          children: <Widget>[
            _googleMap(context, _trucks),
            buildFilters(),
            Positioned(child: _mapKey(context), top: 50.0, left: 0.0),
          ]
        )
    );
          // _horizontalContainer()
  }




  Container buildFilters() {
    return Container(
      color: Colors.teal,
      child: Row(
        children: [
          SizedBox(width: 50.0),
          _priceFilter(),
          SizedBox(width: 50.0),
          _foodTypeFilter(),
          SizedBox(width: 50.0),
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
        borderRadius: selected ? BorderRadius.circular(12) : BorderRadius.circular(3),
        border: Border.all(
          color: Colors.teal,
          width: 3,
        ),
        color: selected ? Colors.white : Colors.teal,
      ),
      width: selected ? 150.0 : 20.0,
      height: selected ? 200.0 : 25.0,
      //color: Colors.teal,
      alignment: FractionalOffset(0.0,1.0),
      duration: Duration(seconds: 1),
      curve: Curves.fastOutSlowIn,
      child: selected ? _mapKeyList(context) : Align(alignment: Alignment(0.0,0.0), child: Icon(Icons.arrow_right, color: Colors.white, size: 20.0)),
    );
}

  Widget _mapKeyList(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(0.5),
      children: const <Widget>[
        Align(
          alignment: Alignment.topRight,
          child: Icon(Icons.arrow_left, color: Colors.teal, size: 20.0),
        ),
        Card(
          child: ListTile(
            leading: Image(image: AssetImage('assets/images/savedTruck.png'), height: 30.0, width: 30.0),
            title: Text('Saved'),
          ),
        ),
        Card(
          child: ListTile(
            leading: Image(image: AssetImage('assets/images/triedTruck.png'), height: 30.0, width: 30.0),
            title: Text('Tried'),
          ),
        ),
        Card(
          child: ListTile(
            leading: Image(image: AssetImage('assets/images/newTruck.png'), height: 30.0, width: 30.0),
            title: Text('New'),
          ),
        ),
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