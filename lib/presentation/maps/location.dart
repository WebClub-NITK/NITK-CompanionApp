import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class NITKLocation extends Equatable {
  final String name;
  final LatLng locationLatLng;
  final String image;
  final String description;

  NITKLocation(this.name, this.locationLatLng, this.image, this.description);

  @override
  // TODO: implement props
  List<Object> get props => [name, locationLatLng, image, description];
}
