import 'package:flutter/material.dart';
import 'package:food_truck_finder/custom_info_window.dart';
import 'package:food_truck_finder/data_search.dart';


class MapPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MapPageState();

}

class _MapPageState extends State<MapPage> {

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
              showSearch(context: context, delegate: DataSearch());
            }
          ),
        leading: IconButton(
          icon: Icon(Icons.arrow_left),
          onPressed: () { },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () { }
          )
        ],
      ),
      body: Stack(
        children: <Widget>[
          _googleMap(context),
          // _horizontalContainer()
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



