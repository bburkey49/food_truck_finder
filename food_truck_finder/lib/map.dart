import 'package:flutter/material.dart';
import 'package:food_truck_finder/custom_info_window.dart';
import 'package:food_truck_finder/data_search.dart';
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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search",
        style: TextStyle(
          color: Colors.black,
          fontSize: 18,
        ),
        textAlign: TextAlign.start,
        
        ),
        actions: <Widget>[
          IconButton(
            color: Colors.black,
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: DataSearch());
            },)
        ],
      ),
      body: Stack(
        children: <Widget>[
          _googleMap(context),
          buildFilters(),
          // _horizontalContainer()
        ],
      ),
    );
    
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

  Widget _googleMap(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: CustomInfoWindow()
    );
  }

}