import 'dart:math';
import 'package:food_truck_finder/menu.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

// class Truck {
//   String name;
//   int rating;
//
//   //String pathToImage;
//   String foodType;
//   LatLng location;
//   String price;
//
//   //List menu = [];
//
//
//   Truck(this.name,
//       this.rating,
//       this.foodType,
//       this.location,
//       this.price);
//
// }






import 'package:json_annotation/json_annotation.dart';
// part 'truck.g.dart';


//@JsonSerializable()

class Truck {
  String name;
  int rating;
  String pathToImage;
  String foodType;
  LatLng location;
  String price;
  Menu menu;


  Truck({this.name,
    this.rating,
    this.pathToImage,
    this.foodType,
    this.location,
    this.price,
    this.menu
  });

  factory Truck.fromJson(Map<String, dynamic> json) {
    var rng = new Random();
    return Truck(
      name: json['name'],
      rating: json['rating'],
      pathToImage: json['pathToImage'],
      foodType: json['foodType'],
      location: LatLng(rng.nextDouble() * .01 + 44.9728, rng.nextDouble() * .01 +  -93.2610),
      price: '\$' * json['price'],
      menu: Menu.fromJson(json['menu'] as List)
    );
  }

  String toString() => '\nName: ${this.name}\nPrice: ${this.price}\nRating: ${this.rating}\n\n';

  // String getPriceString(int num){
  //   return '\$' * num;
  // }

}
  // Map<String, dynamic> toJson() => _$TruckToJson(this);


