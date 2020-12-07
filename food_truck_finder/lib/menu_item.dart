
import 'package:json_annotation/json_annotation.dart';
// part 'truck.g.dart';


//@JsonSerializable()

class MenuItem {
  String name;
  String desc;
  String price;


  MenuItem({
    this.name,
    this.desc,
    this.price
  });

  factory MenuItem.fromJson(Map<String, dynamic> json) {
    return MenuItem(
      name: json['name'],
      desc: json['desc'],
      price: json['price'],
    );
  }

}