
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Truck {
  String name;
  int rating;

  //String pathToImage;
  String foodType;
  LatLng location;
  String price;

  //List menu = [];


  Truck(this.name,
      this.rating,
      this.foodType,
      this.location,
      this.price);

}






// import 'package:json_annotation/json_annotation.dart';
// part 'truck.g.dart';
//
//
// @JsonSerializable()
//
// class Truck {
//   String name;
//   int rating;
//   String pathToImage;
//   String foodType ;
//   String price;
//   List menu = [];
//
//
//   Truck(
//       this.name,
//       this.rating,
//       this.pathToImage,
//       this.foodType,
//       this.price,
//       this.menu
//       );
//
//   factory Truck.fromJson(Map<String, dynamic> json) => _$TruckFromJson(json);
//
//   Map<String, dynamic> toJson() => _$TruckToJson(this);


