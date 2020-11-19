
import 'package:flutter/material.dart';
import 'package:food_truck_finder/data_search.dart';


class SearchB extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _SearchB();
  }
}

class _SearchB extends State<SearchB> {
  int price = 10;

  Widget _priceFilter() {
    var _prices = ["\$", "\$\$", "\$\$\$"];
    var _currentItemSelected = "\$";

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
             _currentItemSelected = newValueSelected;
          });
        },

        value:  _currentItemSelected,

      ),
    );
  }

  Widget _foodTypeFilter() { 
    var _foods = ["Mexican", "Italian", "American"];
    var _currentItemSelected = "Mexican";

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
             _currentItemSelected = newValueSelected;
          });
        },

        value:  _currentItemSelected,

      ),
    );
  }

  Widget _reviewFilter() { 
    var _reviews = ["*", "**", "***", "****", "*****"];
    var _currentItemSelected = "*****";

    return Container(
      child: DropdownButton<String>(
        items: _reviews.map((String_dropDownStringItem) {
          return DropdownMenuItem<String>(
            value: String_dropDownStringItem,
            child: Text(String_dropDownStringItem),
          );
        }).toList(),

        onChanged:  (String newValueSelected ) {
          setState(() {
             _currentItemSelected = newValueSelected;
          });
        },

        value:  _currentItemSelected,

      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Search Food Trucks",
        style: TextStyle(
          color: Colors.black,
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
      body: buildFilters(),
    );
  }

  Container buildFilters() {
    return Container(
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
}

// class DateSearch extends SearchDelegate<String>{
//   final List<String> foodTrucksList = [
//     "EL FUEGO",
//     "FETCH NE",
//     "MARKET BBQ",
//     "FOXY FALAFEL",
//     "THE SOUP COUP"
//   ];
//
//   final List<String> foodTrucks = [
//     "EL FUEGO",
//     "FOXY FALAFEL"
//   ];
//
//   @override
//   List<Widget> buildActions(BuildContext context) {
//       return[
//         IconButton(
//           icon: Icon(Icons.clear),
//           onPressed: () {
//             query = '';
//            },
//           )
//         ];
//     }
//
//     @override
//     Widget buildLeading(BuildContext context) {
//       return IconButton(
//         icon: BackButtonIcon(),
//         onPressed: () {
//           close(context, null);
//         },
//       );
//     }
//
//     @override
//     Widget buildResults(BuildContext context) {
//       return Container(
//         // Return the truck info page
//       );
//     }
//
//     @override
//     Widget buildSuggestions(BuildContext context) {
//       final suggestionTrucks = query.isEmpty
//       ? foodTrucks
//       : foodTrucksList.where((p) => p.startsWith(query)).toList();
//         return ListView.builder(itemBuilder: (context,index) => ListTile(
//           title: Text(suggestionTrucks[index]),
//         ),
//         itemCount: suggestionTrucks.length ,
//       );
//
//     }
// }