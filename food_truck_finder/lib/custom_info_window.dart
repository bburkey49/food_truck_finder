import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:food_truck_finder/truck.dart';
import 'package:food_truck_finder/truck_info_page.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:clippy_flutter/clippy_flutter.dart';
import 'package:food_truck_finder/truck_info_page.dart';
import 'globals.dart';

import 'info_window_model.dart';

class CustomInfoWindow extends StatefulWidget {

  // CustomInfoWindow({
  //   this.truckSearchStream,
  // });
  //
  // final Stream<List<Truck>> truckSearchStream;

  final List<Truck> trucks;

  CustomInfoWindow({
    this.trucks,
  });

  // final Stream<List<Truck>> truckSearchStream;




  @override
  _CustomInfoWindowState createState() => _CustomInfoWindowState(this.trucks);
}

class _CustomInfoWindowState extends State<CustomInfoWindow> {
  GoogleMapController mapController;
  final LatLng _center = LatLng(44.9778, -93.2650);
  final double _zoom = 15.0;

  final double _infoWindowWidth = 250;
  final double _markerOffset = 205;



  Set<Marker> _markers = Set<Marker>();
  List<Truck> _trucks = [];
  bool loaded = false;
  BitmapDescriptor iconTried;
  BitmapDescriptor iconSaved;
  BitmapDescriptor iconNew;
  final callback = null;

  Stream<List<Truck>> _truckStream;


  _CustomInfoWindowState(List<Truck> trucks) {
    _trucks = trucks;
  }


  //
  // _CustomInfoWindowState(Stream<List<Truck>> truckSearchStream) {
  //   _truckStream = truckSearchStream;
  // }

  // _getTrucks(String json) {
  //   List<dynamic> rawTrucks = jsonDecode(json) as List;
  //
  //   rawTrucks.forEach((element) {
  //     setState(() {
  //       _trucks.add(Truck.fromJson(element));
  //     });
  //   });
  // }

  // Future<String> loadAsset(BuildContext context) {
  //   return DefaultAssetBundle.of(context).loadString('assets/data/trucks.json');
  // }

  onItemChanged(String value, InfoWindowModel providerObject) {
    setState(() {
      //_markers.clear();
      _trucks.where((t) => !t.name.toLowerCase().contains(value.toLowerCase()))
          .toList()
          .forEach((prosp) => prosp.setMapVisibility(false)
      );
    }
    );
  }


  BitmapDescriptor getIcon(Truck truck) {
    if(likedTrucks.any((element) => element.name == truck.name)){
      return iconSaved;
    }
    else if(visitedTrucks.any((element) => element.name == truck.name)) {
      return iconTried;
    }
    else {
      return iconNew;
    }
  }


  @override
  Widget build(BuildContext context) {
    final providerObject = Provider.of<InfoWindowModel>(context, listen: false);
    // Future<String> fileName = Future<String>.sync(() {
    //   return DefaultAssetBundle.of(context).loadString('assets/data/trucks.json');
    // });
    //
    // StreamBuilder<List<Truck>> truckStreamBuilder = StreamBuilder<List<Truck>>(
    //   stream: _truckStream,
    //   builder: (context, snapshot) {
    //     return
    //   },
    // )


    Future<BitmapDescriptor> truckIconTried = Future<BitmapDescriptor>.sync(() {
      return BitmapDescriptor.fromAssetImage(
          ImageConfiguration(
            size: Size(1, 10),
            devicePixelRatio: .1,
          ),
          'assets/images/smallTried.png');
    }
    );

    Future<BitmapDescriptor> truckIconSaved = Future<BitmapDescriptor>.sync(() {
      return BitmapDescriptor.fromAssetImage(
          ImageConfiguration(
            size: Size(1, 10),
            devicePixelRatio: .1,
          ),
          'assets/images/smallTruck.png');
      }
    );

    Future<BitmapDescriptor> truckIconNew = Future<BitmapDescriptor>.sync(() {
      return BitmapDescriptor.fromAssetImage(
          ImageConfiguration(
            size: Size(1, 10),
            devicePixelRatio: .1,
          ),
          'assets/images/smallNew.png');
    }
    );

    truckIconTried.then((bD) {
      setState(() {
        iconTried = bD;
      });
    });

    truckIconSaved.then((bD) {
      setState(() {
        iconSaved = bD;
      });
    });

    truckIconNew.then((bD) {
      setState(() {
        iconNew = bD;
      });
    });




    _trucks.forEach((v) => _markers.add(
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
          icon: getIcon(v),
          visible: v.mapVisible
        )
    ));
    //loaded = true;


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
                                            // fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                    Row(
                                        children: <Widget>[
                                          Text(
                                            providerObject.truck.computeDistance(_center),
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black45,
                                            ),
                                          ),
                                          Expanded(
                                              child: Text(
                                                'Minneapolis',
                                                textDirection: TextDirection.ltr,
                                                textAlign: TextAlign.right,
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black45,
                                                ),
                                              )),
                                        ]
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
                                                Navigator.of(context).push(
                                                    MaterialPageRoute(builder: (context) => TruckInfo(truck: providerObject.truck))
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




String _computeDistance(LatLng source, LatLng dest) {
  double lngLat = sqrt(pow(source.latitude - dest.latitude, 2) + pow(source.longitude - dest.latitude, 2)) / 60;
  return '${lngLat.toStringAsFixed(1)} miles';
}