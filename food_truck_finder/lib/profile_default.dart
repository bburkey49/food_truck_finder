

import 'package:food_truck_finder/truck.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ProfileDefault {
  String _name = 'Emily W';
  List<Truck> _triedTrucks = [];
  List<Truck> _savedTrucks = [];
  Map<String, bool> _dietaryRestrictions = {
    'gluten-free' : false,
    'vegetarian' : false,
    'vegan' : false,
    'kosher' : false,
  };

  LatLng location = LatLng(44.9778, -93.2650);
  bool locationVisible = true;

  ProfileDefault();


  void saveTruck(Truck truck) {
    _savedTrucks.add(truck);
  }

  void unsaveTruck(Truck truck) {
    _savedTrucks.remove(truck);
  }

  void tryATruck(Truck truck) {
    _triedTrucks.add(truck);
  }

  void unTryATruck(Truck truck) {
    _triedTrucks.remove(truck);
  }


  void setLocationVisibility(bool visibility) {
    locationVisible = visibility;
  }

  void manageDietaryRestrictions(List<String> res) {
    _dietaryRestrictions.forEach((name, restricted) {
      res.contains(name) ? restricted = true : restricted = false;
    });
  }



}