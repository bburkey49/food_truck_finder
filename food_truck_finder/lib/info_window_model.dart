import 'package:flutter/material.dart';
import 'package:food_truck_finder/truck.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class InfoWindowModel extends ChangeNotifier {
  bool _showInfoWindow = false;
  bool _tempHidden = false;
  Truck _truck;
  double _leftMargin;
  double _topMargin;
  GoogleMapController _controller;

  void rebuildInfoWindow() {
    notifyListeners();
  }

  void updateTruck(Truck truck) {
    _truck = truck;
  }

  void updateVisibility(bool visibility) {
    _showInfoWindow = visibility;
  }

  void updateGoogleMapController(GoogleMapController controller) {
    _controller = controller;
  }

  void updateInfoWindow(
      BuildContext context,
      GoogleMapController controller,
      LatLng location,
      double infoWindowWidth,
      double markerOffset,
      ) async {
          ScreenCoordinate screenCoordinate =
          await controller.getScreenCoordinate(location);
          double devicePixelRatio = MediaQuery.of(context).devicePixelRatio;
          double left = (screenCoordinate.x.toDouble() / devicePixelRatio) -
              (infoWindowWidth / 2);
          double top =
              (screenCoordinate.y.toDouble() / devicePixelRatio) - markerOffset;
          if (left < 0 || top < 0) {
            _tempHidden = true;
          } else {
            _tempHidden = false;
            _leftMargin = left;
            _topMargin = top;
          }
      }

  bool get showInfoWindow =>
      (_showInfoWindow == true && _tempHidden == false) ? true : false;

  double get leftMargin => _leftMargin;

  double get topMargin => _topMargin;

  Truck get truck => _truck;
}