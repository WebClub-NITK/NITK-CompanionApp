import 'package:equatable/equatable.dart';

class CollegeLocation extends Equatable {
  int pk;
  String name;
  String latitude;
  String longitude;
  String description;
  String type;
  CollegeLocation(
      {this.description,
      this.latitude,
      this.longitude,
      this.name,
      this.pk,
      this.type});

  @override
  List<Object> get props =>
      [description, latitude, longitude, description, type, name];
}
