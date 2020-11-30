import 'package:flutter/material.dart';
import 'package:food_truck_finder/custom_info_window.dart';
import 'package:food_truck_finder/data_search.dart';


class MapPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MapPageState();

}

class _MapPageState extends State<MapPage> {

  bool selected = true;

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
          _mapKey(context),
          // _horizontalContainer()
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
      alignment: Alignment.topLeft,
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

  Widget _googleMap(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: CustomInfoWindow()
    );
  }

}



