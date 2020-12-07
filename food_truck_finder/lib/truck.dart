import 'dart:convert';
import 'dart:math';
import 'package:flutter/cupertino.dart';
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

  bool mapVisible = true;

  static void setAllVisible() {
    _trucks.forEach((element) => element.mapVisible = true);
  }

  void setMapVisibility(bool visibility){
    mapVisible = visibility;
    print('false');
  }

  static List<Truck> _trucks;


  static List<Truck> get trucks => _trucks;

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

  static _getTrucks(String json) {
    List<dynamic> rawTrucks = jsonDecode(json) as List;

    rawTrucks.forEach((element) {
        _trucks.add(Truck.fromJson(element));
    });
  }

  static Future<List<Truck>> buildTrucks(BuildContext context) {
    Future<String> fileName = Future<String>.sync(() {
      return DefaultAssetBundle.of(context).loadString(
          'assets/data/trucks.json');
    });
    fileName.then((fN) => _getTrucks(fN));

    return Future.value(_trucks);
  }



  String computeDistance(LatLng dest) {
    double lngLat = sqrt(pow(location.latitude - dest.latitude, 2) + pow(location.longitude - dest.latitude, 2)) / 60;
    return '${lngLat.toStringAsFixed(1)} miles away';
  }




}



