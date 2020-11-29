
import 'package:food_truck_finder/menu_item.dart';
import 'package:json_annotation/json_annotation.dart';


//@JsonSerializable()

class Menu {
  List<MenuItem> items;

  Menu() {
    items = [];
  }

  factory Menu.fromJson(List<dynamic> json) {
    Menu menu = Menu();
    json.forEach((element) {
      menu.items.add(MenuItem.fromJson(element));
    });
    return menu;
  }

}