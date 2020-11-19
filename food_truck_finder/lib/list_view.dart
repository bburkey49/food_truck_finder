import 'package:flutter/material.dart';
import 'package:food_truck_finder/search_b.dart';
import 'data_search.dart';

class ListViewPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ListViewState();

}

class _ListViewState extends State<ListViewPage> {
  bool filters = false;

  Widget _buildBlock() {
    return ElevatedButton(
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if(states.contains(MaterialState.hovered))
                return Colors.greenAccent;
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
                  shadowColor: Color(0x802196F3),
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
              showSearch(context: context, delegate: DataSearch());
            }
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_left),
          onPressed: () { },
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.filter),
              onPressed: () {
                Navigator.of(context).pushNamed(
                  '/filters'
                );
              }
          ),
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () { }
          )
        ],
      ),
      body: ListView(
              scrollDirection: Axis.vertical,
              children: <Widget>[
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

}


Widget myDetailsContainer1() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Container(
          child: Text("Candy Bliss",
            style: TextStyle(color: Color(0xffe6020a), fontSize: 24.0,fontWeight: FontWeight.bold),)),
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
                  Icons.star, color: Colors.amber,
                  size: 15.0,),),
                Container(child: Icon(
                  Icons.star, color: Colors.amber,
                  size: 15.0,),),
                Container(child: Icon(
                  Icons.star, color: Colors.amber,
                  size: 15.0,),),
                Container(child: Icon(
                  Icons.star, color: Colors.amber,
                  size: 15.0,),),
                Container(child: Icon(
                  Icons.star_border, color: Colors.amber,
                  size: 15.0,),),
                Container(child: Text("(321) \u00B7 0.9 mi",
                  style: TextStyle(color: Colors.black54, fontSize: 18.0,),)),
              ],)),
      ),
      Container(child: Text("Pastries \u00B7 Phoenix,AZ",
        style: TextStyle(color: Colors.black54, fontSize: 18.0,fontWeight: FontWeight.bold),)),
    ],
  );
}


