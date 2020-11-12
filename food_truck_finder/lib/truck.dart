import 'package:google_maps_flutter/google_maps_flutter.dart';

class Truck {
  final String name;
  final String priceRange;
  final int rating;
  final String foodType;
  final LatLng location;


  Truck(
      this.name,
      this.priceRange,
      this.rating,
      this.foodType,
      this.location
      );

}
