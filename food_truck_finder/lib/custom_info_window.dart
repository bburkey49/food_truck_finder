import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:food_truck_finder/truck.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:clippy_flutter/clippy_flutter.dart';

import 'info_window_model.dart';

class CustomInfoWindow extends StatefulWidget {
  @override
  _CustomInfoWindowState createState() => _CustomInfoWindowState();
}

class _CustomInfoWindowState extends State<CustomInfoWindow> {
  GoogleMapController mapController;
  final LatLng _center = LatLng(44.9778, -93.2650);
  final double _zoom = 15.0;

  final double _infoWindowWidth = 250;
  final double _markerOffset = 220;

  //Map truckMap = json.forEach((element))

  final Map<String, Truck> _truckList = {
    "1" : Truck(
        "El Fuego",
        4,
        "Mexican",
        LatLng(44.9758, -93.2620),
        "\$\$"
    ),
    "2" : Truck(
        "Minneapolis Pizza Kitchen",
        3,
        "Italian",
        LatLng(44.9728, -93.2610),
        "\$\$\$"
    ),
    "3" : Truck(
        "yum! kitchen mobile",
        2,
        "American",
        LatLng(44.9738, -93.2690),
        "\$\$"
    ),
  };


  Set<Marker> _markers = Set<Marker>();

  // List<Truck> _getTrucks(String fileName) {
  //   final json = jsonDecode(fileName);
  //   List<Truck> trucks;
  //   return json.forEach((element) {
  //     trucks.add(Truck.fromJson(element));
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final providerObject = Provider.of<InfoWindowModel>(context, listen: false);
    //final List<Truck> temp = _getTrucks('assets/data/trucks.json');
    //print(temp);
    _truckList.forEach(
          (k, v) => _markers.add(
            Marker(
              markerId: MarkerId(v.name),
              position: v.location,
              onTap: () {
                providerObject.updateInfoWindow(
                  context,
                  mapController,
                  v.location,
                  _infoWindowWidth,
                  _markerOffset,
                );
                providerObject.updateTruck(v);
                providerObject.updateVisibility(true);
                providerObject.rebuildInfoWindow();
              },
            ),
          ),
    );

    return Scaffold(
      body: Container(
        child: Consumer<InfoWindowModel>(
          builder: (context, model, child) {
            return Stack(
              children: <Widget>[
                child,
                Positioned(
                  left: 0,
                  top: 0,
                  child: Visibility(
                    visible: providerObject.showInfoWindow,
                    child: (providerObject.truck == null || !providerObject.showInfoWindow) ?
                      Container() :
                      Container(
                        margin: EdgeInsets.only(
                          left: providerObject.leftMargin,
                          top: providerObject.topMargin,
                        ),
                        // Custom InfoWindow Widget starts here
                        child: Column(
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                  color: Colors.white,
                                border: new Border.all(
                                  color: Colors.teal,
                                  width: 1.5,
                                  style: BorderStyle.solid
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    offset: Offset(0.0, 1.0),
                                    blurRadius: 6.0,
                                  ),
                                ],
                              ),
                              height: 150,
                              width: 250,
                              padding: EdgeInsets.all(15),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: <Widget> [
                                            Text(
                                              providerObject.truck.name,
                                              style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                              ),
                                              textAlign: TextAlign.left,
                                            ),
                                            Text(
                                              providerObject.truck.price,
                                              style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                              ),
                                              textAlign: TextAlign.right,
                                            ),
                                          ]
                                        ),
                                        Text(
                                          providerObject.truck.foodType,
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                        Text(
                                          providerObject.truck.location.toString(),
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black45,
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: <Widget> [
                                            IconTheme(
                                              data: IconThemeData(color: Colors.redAccent,),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: List.generate(
                                                  5, // length
                                                      (index) {
                                                    return Icon(
                                                      index < providerObject.truck.rating
                                                          ? Icons.star
                                                          : Icons.star_border,
                                                    );
                                                  },
                                                ),
                                              ),
                                            ),
                                            FloatingActionButton(
                                              foregroundColor: Colors.white,
                                              mini: true,
                                              onPressed: () {
                                                Navigator.of(context).pushNamed(
                                                    '/truck_info'
                                                );
                                              },
                                              child: Icon(Icons.arrow_right),
                                            )
                                          ]
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Triangle.isosceles(
                              edge: Edge.BOTTOM,
                              child: Container(
                                color: Colors.white,
                                width: 20.0,
                                height: 15.0,
                              ),
                            ),
                          ],
                        ),
                  // Custom InfoWindow Widget ends here
                      ),
                  ),
                ),
              ],
            );
          },
          // map
          child: Positioned(
            child: GoogleMap(
              onTap: (position) {
                if (providerObject.showInfoWindow) {
                  providerObject.updateVisibility(false);
                  providerObject.rebuildInfoWindow();
                }
              },
              onCameraMove: (position) {
                if (providerObject.truck != null) {
                  providerObject.updateInfoWindow(
                    context,
                    mapController,
                    providerObject.truck.location,
                    _infoWindowWidth,
                    _markerOffset,
                  );
                  providerObject.rebuildInfoWindow();
                }
              },
              onMapCreated: (GoogleMapController controller) {
                mapController = controller;
              },
              markers: _markers,
              initialCameraPosition: CameraPosition(
                target: _center,
                zoom: _zoom,
              ),
            ),
          ),
        ),
      ),
    );
  }
}