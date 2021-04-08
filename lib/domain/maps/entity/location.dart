import 'package:equatable/equatable.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

class CollegeLocation extends Equatable {
  int pk;
  String name;
  String latitude;
  String longitude;
  String description;
  String type;
  String image;
  LatLng latLng;
  CollegeLocation(
      {this.description,
      this.latitude,
      this.longitude,
      this.name,
      this.pk,
      this.type,
      this.image,
      this.latLng});

  @override
  List<Object> get props =>
      [description, latitude, longitude, description, type, name];
}
