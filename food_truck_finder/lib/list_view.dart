import 'package:flutter/material.dart';
import 'package:food_truck_finder/search_b.dart';
// import 'data_search.dart';

class ListViewPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ListViewState();

}

class _ListViewState extends State<ListViewPage> {
  bool filters = false;
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

  Widget _buildBlock() {
    return ElevatedButton(

      style: ButtonStyle(
        overlayColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if(states.contains(MaterialState.hovered))
                return Colors.teal;
              return null;
            }
        )
      ),
      onPressed: () {
        Navigator.of(context).pushNamed(
            '/truck_info'
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
                            child: myDetailsContainer1()
                        ),
                        Container(
                            height: 250,
                            width: 250,
                            child: ClipRRect(
                                borderRadius: new BorderRadius.circular(24.0),
                                child: Image(
                                    fit: BoxFit.contain,
                                    alignment: Alignment.topRight,
                                    image: AssetImage('assets/images/other_candy_truck.jpg')
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
    return Scaffold(
      appBar: AppBar(
        title:
        TextField(
            decoration: InputDecoration(
                hintText: 'Search'
            ),
            onTap: () {
              showSearch(context: context, delegate: DateSearch());
            }
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_left),
          onPressed: () { },
        ),
        actions: <Widget>[
          // IconButton(
          //     icon: Icon(Icons.filter),
          //     onPressed: () {
          //       Navigator.of(context).pushNamed(
          //         '/filters'
          //       );
          //     }
          // ),
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () { }
          )
        ],
      ),
      body: ListView(
              scrollDirection: Axis.vertical,
              children: <Widget>[
                buildFilters(),
                _buildBlock(),
                _buildBlock(),
                _buildBlock(),
                _buildBlock(),
                _buildBlock(),
                _buildBlock()
              ],
            )
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
}


Widget myDetailsContainer1() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Container(
          child: Text("Candy Bliss",
            style: TextStyle(color: Colors.redAccent, fontSize: 24.0,fontWeight: FontWeight.bold),)),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(child: Text("4.3",
                  style: TextStyle(color: Colors.black54, fontSize: 18.0,),)),
                Container(child: Icon(
                  Icons.star, color: Colors.redAccent,
                  size: 15.0,),),
                Container(child: Icon(
                  Icons.star, color: Colors.redAccent,
                  size: 15.0,),),
                Container(child: Icon(
                  Icons.star, color: Colors.redAccent,
                  size: 15.0,),),
                Container(child: Icon(
                  Icons.star, color: Colors.redAccent,
                  size: 15.0,),),
                Container(child: Icon(
                  Icons.star_border, color: Colors.redAccent,
                  size: 15.0,),),
                Container(child: Text("(321) \u00B7 0.9 mi",
                  style: TextStyle(color: Colors.black54, fontSize: 18.0,),)),
              ],)),
      ),
      Container(child: Text("Pastries \u00B7 St Paul, MN",
        style: TextStyle(color: Colors.black, fontSize: 18.0,fontWeight: FontWeight.bold),)),
    ],
  );
}


