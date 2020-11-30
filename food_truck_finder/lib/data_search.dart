import 'package:flutter/material.dart';
import 'truck_info_page.dart';


class DataSearch extends SearchDelegate<String> {

  final trucks = [
    'tacos',
    'chicken',
    'calzones',
    'cake',
    'cambodian',
    'cheese',
    'pizza',
    'ice cream',
    'fries',
    'pancakes',
    'hot dogs',
    'wings',
    'papaya',
    'wasabi',
    'wheatgrass juice',

    'waffles',
    'burgers',
  ];

  final recents = [
    'El Fuego',
    'Taco Taxi',
    'Market BBQ',
    'yum!'
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = "";
          }
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed: () {
          close(context, null);
        }
    );
  }


  @override
  Widget buildResults(BuildContext context) {
    return Card(
      color: Colors.redAccent,
      shape: StadiumBorder(),
      child: Center(
        child: Text(query)
      )
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList =
      query.isEmpty ?
      recents :
      trucks.where((c) => c.startsWith(query)).toList();

    return ListView.builder(
      itemBuilder: (context, index) =>
          ListTile(
            onTap: () {
              showResults(context);
            },
            leading: Icon(
              Icons.emoji_transportation_rounded
            ),
            title: RichText(
                text: TextSpan(
                    text: suggestionList[index].substring(0, query.length),
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    children: [
                    TextSpan(
                      text: suggestionList[index].substring(query.length),
                      style: TextStyle(color: Colors.grey)
                    )
                  ]
                )
            )
          ),
      itemCount: suggestionList.length,

    );

  }

}