import 'package:flutter/material.dart';
import 'package:flutter_search_bar/flutter_search_bar.dart';

class TruckSearchBar extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _TruckSearchBar();
  }
}


class _TruckSearchBar extends State<TruckSearchBar> {
  final GlobalKey<ScaffoldState> _formKey = GlobalKey<ScaffoldState>();

  SearchBar searchBar;

  @override
  Widget build(BuildContext context) {
    searchBar = SearchBar(
      setState: setState,
      buildDefaultAppBar: buildSearchBar,
      inBar: false,
      onSubmitted: onSubmitted,
      onClosed: () {
        print('Closed!');
      },
      onCleared: () {
        print('Cleared!');
      }
    );
    return Container(
      child: searchBar.build(context),
    );
  }


  AppBar buildSearchBar(BuildContext context) {
    return AppBar(
        title: Text('Search'),
        actions: [
          searchBar.getSearchAction(context)
        ]
    );
  }


  void onSubmitted(String value) {
    setState(() {
      return _formKey.currentState.showSnackBar(
          SnackBar(content: Text('$value!'))
      );
    });
  }

}