import 'dart:async';
import 'package:flutter/material.dart';
import 'package:food_truck_finder/data_search.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  Completer<GoogleMapController> _controller = Completer();
  bool isSearching = false;

  //final _form_key = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
          TextField(
            decoration: InputDecoration(
              hintText: 'Search'
            ),
            onTap: () {
              showSearch(context: context, delegate: DataSearch());
            }
          ),
        leading: IconButton(
          icon: Icon(Icons.arrow_left),
          onPressed: () { },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () { }
          )
        ],
      ),
      body: Stack(
        children: <Widget>[
          _googleMap(context),
          // _zoomIn(),
          // _zoomOut(),
          // _horizontalContainer()
        ],
      ),
    );
  }

  Widget _googleMap(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: CameraPosition(
          target: LatLng(44.9778, -93.2650),
          zoom: 15
        ),
        onMapCreated: (GoogleMapController controller) => {
          _controller.complete(controller)
        },
        markers: {
          minneapolisMarker,
          minneapolisMarker2
        },
      ),
    );
  }

  Marker minneapolisMarker = Marker(
    markerId: MarkerId('minneapolisMarker'),
    position: LatLng(44.9778, 93.2650),
    infoWindow: InfoWindow(title: 'truck1'),
    icon: BitmapDescriptor.defaultMarkerWithHue(
      BitmapDescriptor.hueBlue
    )
  );

  Marker minneapolisMarker2 = Marker(
      markerId: MarkerId('minneapolisMarker2'),
      position: LatLng(44.9778, 93.2650),
      infoWindow: InfoWindow(title: 'truck2'),
      icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueBlue
      )
  );


}

