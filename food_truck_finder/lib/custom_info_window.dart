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
  final double _markerOffset = 170;

  final Map<String, Truck> _truckList = {
    "1": Truck(
      "Timmy's Tacos",
      "\$\$",
      2,
      "Mexican",
      LatLng(44.9798, -93.2610),
    ),
    "2": Truck(
      "Manny's Muffins",
      "\$",
      4,
      "Baked Goods",
      LatLng(44.9728, -93.2620),
    ),
  };

  Set<Marker> _markers = Set<Marker>();

  @override
  Widget build(BuildContext context) {
    final providerObject = Provider.of<InfoWindowModel>(context, listen: false);
    //final infoWindowModel = InfoWindowModel();
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
                    child: (providerObject.truck == null ||
                        !providerObject.showInfoWindow)
                        ? Container()
                        : Container(
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
                              gradient: new LinearGradient(
                                colors: [
                                  Colors.white,
                                  Color(0xffffe6cc),
                                ],
                                end: Alignment.bottomCenter,
                                begin: Alignment.topCenter,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  offset: Offset(0.0, 1.0),
                                  blurRadius: 6.0,
                                ),
                              ],
                            ),
                            height: 100,
                            width: 250,
                            padding: EdgeInsets.all(15),
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    Text(
                                      providerObject.truck.name,
                                      style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black45,
                                      ),
                                    ),
                                    IconTheme(
                                      data: IconThemeData(
                                        color: Colors.red,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment
                                            .spaceBetween,
                                        children: List.generate(
                                          5,
                                              (index) {
                                            return Icon(
                                              index <
                                                  providerObject
                                                      .truck.rating
                                                  ? Icons.star
                                                  : Icons.star_border,
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Triangle.isosceles(
                            edge: Edge.BOTTOM,
                            child: Container(
                              color: Color(0xffffe6cc),
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