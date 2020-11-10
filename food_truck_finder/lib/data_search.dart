import 'package:flutter/material.dart';


class DataSearch extends SearchDelegate<String> {

  final trucks = [
    'tacos',
    'waffles',
    'burgers',
  ];

  final recents = [
    'raising canes',
    'b dubs',
    'bon chon',
    'insomnia'
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
      color: Colors.red,
      shape: StadiumBorder(),
      child: Center(
        child: Text(query)
      )
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestion_list = query.isEmpty ? recents : trucks.where((c) => c.startsWith(query)).toList();

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
                    text: suggestion_list[index].substring(0, query.length),
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    children: [
                    TextSpan(
                      text: suggestion_list[index].substring(query.length),
                      style: TextStyle(color: Colors.grey)
                    )
                  ]
                )
            )
          ),
      itemCount: suggestion_list.length,

    );

  }

}