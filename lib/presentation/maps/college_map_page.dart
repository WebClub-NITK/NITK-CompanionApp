import 'dart:async';

import 'package:utilapp/presentation/maps/location.dart';
import 'package:utilapp/presentation/maps/markers.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapsPage extends StatefulWidget {
  @override
  _MapsPageState createState() => _MapsPageState();
}

class _MapsPageState extends State<MapsPage> {
  BitmapDescriptor bitmap;
  BitmapDescriptor pinLocationIcon;
  Set<Marker> _markers = {};
  Completer<GoogleMapController> _controller = Completer();
  Marker _marker;
  Location location = new Location();
  void initializeMarkers(List<NITKLocation> localtionsList) {
    for (int i = 0; i < localtionsList.length; i++) {
      BitmapDescriptor.fromAssetImage(
              ImageConfiguration(size: Size(24, 24)), localtionsList[i].image)
          .then((onValue) {
        bitmap = onValue;
        _marker = Marker(
          onTap: () {
            _scaffoldKey.currentState
                .showBottomSheet<void>((BuildContext context) {
              return Container(
                height: 200,
                color: Colors.blueAccent,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(localtionsList[i].name),
                      FlatButton(
                        child: const Text('Close BottomSheet'),
                        onPressed: () => Navigator.pop(context),
                      )
                    ],
                  ),
                ),
              );
            });
          },
          markerId: MarkerId(localtionsList[i].locationLatLng.toString()),
          position: localtionsList[i].locationLatLng,
          infoWindow: InfoWindow(
            title: localtionsList[i].name,
          ),
          icon: bitmap,
        );
        _markers.add(_marker);
      });
    }
    setState(() {});
  }

  void initState() {
    super.initState();
    initializeMarkers(NITK_LOCATIONS_LIST);
    checkPermission();
  }

  LatLng latLng;
  Completer<GoogleMapController> controller = Completer();

  void checkPermission() async {
    await location.requestService();
  }

  GoogleMapController mapController;

  LatLng _center = const LatLng(13.0110, 74.7943);
  LatLng _ECELatLng = const LatLng(13.011159428377379, 74.79217109978454);
  _handleTap(LatLng point) {
    setState(() {
      _markers.add(Marker(
        onTap: () {
          _scaffoldKey.currentState
              .showBottomSheet<void>((BuildContext context) {
            return Container(
              height: 200,
              color: Colors.amber,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const Text('BottomSheet'),
                    FlatButton(
                      child: const Text('Close BottomSheet'),
                      onPressed: () => Navigator.pop(context),
                    )
                  ],
                ),
              ),
            );
          });
        },
        markerId: MarkerId(point.toString()),
        position: point,
        infoWindow: InfoWindow(
          title: 'Helloo',
        ),
        icon:
            BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueMagenta),
      ));
    });
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    CameraPosition initialLocation =
        CameraPosition(zoom: 18, bearing: 30, target: _center);
    return MaterialApp(
      home: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text('Maps Sample App'),
        ),
        body: GoogleMap(
            //onTap: _handleTap,
            myLocationEnabled: true,
            compassEnabled: true,
            markers: _markers,
            buildingsEnabled: true,
            mapToolbarEnabled: true,
            onLongPress: (LatLng latLng) {
              mapController.animateCamera(CameraUpdate.newCameraPosition(
                  CameraPosition(target: _center, zoom: 18)));
            },
            mapType: MapType.satellite,
            initialCameraPosition: initialLocation,
            cameraTargetBounds: new CameraTargetBounds(new LatLngBounds(
                northeast: LatLng(13.015237558971684, 74.79886572433706),
                southwest: LatLng(13.007449792032991, 74.7889308225076))),
            onMapCreated: (GoogleMapController controller) {
              mapController = controller;
              _controller.complete(controller);
            }),
      ),
    );
  }
}
