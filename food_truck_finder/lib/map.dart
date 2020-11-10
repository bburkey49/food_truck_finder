import 'dart:async';
import 'package:flutter/material.dart';
import 'package:food_truck_finder/data_search.dart';
import 'package:food_truck_finder/point_object.dart';
import 'package:food_truck_finder/pop_up_route.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  Completer<GoogleMapController> _controller = Completer();
  bool isSearching = false;

  InfoWidgetRoute _infoWidgetRoute;


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


  Widget _horizontalContainer() {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20.0),
        height: 150.0,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
            )
          ],
        )
      )
    );
  }


  Marker minneapolisMarker = Marker(
    markerId: MarkerId('minneapolisMarker'),
    position: LatLng(44.9798, -93.2610),
    infoWindow: InfoWindow(title: 'truck1'),
    icon: BitmapDescriptor.defaultMarkerWithHue(
      BitmapDescriptor.hueBlue
    )
  );

  Marker minneapolisMarker2 = Marker(
    markerId: MarkerId('minneapolisMarker2'),
    position: LatLng(44.9728, -93.2620),
    infoWindow: InfoWindow(title: 'truck2'),
    icon: BitmapDescriptor.defaultMarkerWithHue(
        BitmapDescriptor.hueBlue
    ),
    onTap: () { }
  );

  onPointTap(PointObject point) async {
    final RenderBox renderBox = context.findRenderObject();
    Rect _itemRect = renderBox.localToGlobal(Offset.zero) & renderBox.size;

    _infoWidgetRoute = InfoWidgetRoute(
      child: point.child,
      buildContext: context,
      textStyle: const TextStyle(
        fontSize: 14,
        color: Colors.black,
      ),
      mapsWidgetSize: _itemRect,
    );

    // await _controller.animateCamera(
    //   CameraUpdate.newCameraPosition(
    //     CameraPosition(
    //       target: LatLng(
    //         point.location.latitude - 0.0001,
    //         point.location.longitude,
    //       ),
    //       zoom: 15,
    //     ),
    //   ),
    // );
    // await _controller.animateCamera(
    //   CameraUpdate.newCameraPosition(
    //     CameraPosition(
    //       target: LatLng(
    //         point.location.latitude,
    //         point.location.longitude,
    //       ),
    //       zoom: 15,
    //     ),
    //   ),
    // );
  }
}



