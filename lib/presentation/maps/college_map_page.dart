import 'dart:async';

import 'package:utilapp/presentation/maps/location.dart';
import 'package:utilapp/presentation/maps/markers.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:utilapp/presentation/maps/single_location_page.dart';
import 'package:utilapp/presentation/maps/test.dart';
import 'package:utilapp/domain/maps/entity/location.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MapsPage extends StatefulWidget {
  @override
  _MapsPageState createState() => _MapsPageState();
  final List<CollegeLocation> locationList;

  MapsPage(this.locationList, {Key key}) : super(key: key);
}

class _MapsPageState extends State<MapsPage> {
  BitmapDescriptor bitmap;
  BitmapDescriptor pinLocationIcon;
  Set<Marker> _markers = {};
  Completer<GoogleMapController> _controller = Completer();
  Marker _marker;
  Location location = new Location();
  void initializeMarkers(List<CollegeLocation> localtionsList) {
    for (int i = 0; i < localtionsList.length; i++) {
      if (localtionsList[i].latLng != null) {
        print("ADDING MARKER FOR ${localtionsList[i].name}");
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
            markerId: MarkerId(localtionsList[i].latLng.toString()),
            position: localtionsList[i].latLng,
            infoWindow: InfoWindow(
              title: localtionsList[i].name,
            ),
            icon: bitmap,
          );
          setState(() {
            _markers.add(_marker);
            print(_markers);
            print("ALL MARKERS INITIALIZED");
          });
        });
      }
    }
  }

  void initState() {
    super.initState();
    print(widget.locationList[1].latitude);
    initializeMarkers(widget.locationList);
    checkPermission();
  }

  LatLng latLng;
  Completer<GoogleMapController> controller = Completer();

  void checkPermission() async {
    await location.requestService();
  }

  GoogleMapController mapController;

  LatLng _center = const LatLng(13.0110, 74.7943);

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    CameraPosition initialLocation =
        CameraPosition(zoom: 18, bearing: 30, target: _center);
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: FaIcon(
            FontAwesomeIcons.list,
            color: Colors.black,
          ),
          onPressed: () {
            _scaffoldKey.currentState
                .showBottomSheet<void>((BuildContext context) {
              return Container(
                height: 400,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    FlatButton(
                      child: const Text('Close BottomSheet'),
                      onPressed: () => Navigator.pop(context),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: widget.locationList.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SingleLocationPage(
                                          widget.locationList[index])));
                            },
                            child: ListTile(
                              title: Text(widget.locationList[index].name),
                              subtitle:
                                  Text(widget.locationList[index].description),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            });
          },
          backgroundColor: Color(0xFFfeca59),
        ),
        key: _scaffoldKey,
        appBar: AppBar(
          leading: Center(
              child: FaIcon(
            FontAwesomeIcons.list,
            color: Colors.black,
          )),
          title: Text(
            'map',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Color(0xFFfeca59),
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
            //mapType: MapType.satellite,
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
