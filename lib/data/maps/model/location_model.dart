import 'dart:convert';

import 'package:utilapp/domain/maps/entity/location.dart';

List<CollegeLocationModel> listOfCollegeLocationModelFromJsonString(
        String str) =>
    List<CollegeLocationModel>.from(
        json.decode(str).map((x) => CollegeLocationModel.fromJson(x)));

List<CollegeLocationModel> listOfCollegeLocationModelFromJson(List jsonList) =>
    List<CollegeLocationModel>.from(
        jsonList.map((x) => CollegeLocationModel.fromJson(x)));

class CollegeLocationModel extends CollegeLocation {
  CollegeLocationModel({
    int pk,
    String name,
    String latitude,
    String longitude,
    String description,
    String type,
  }) : super(
            pk: pk,
            name: name,
            latitude: latitude,
            longitude: longitude,
            description: description,
            type: type);
  factory CollegeLocationModel.fromJson(Map<String, dynamic> json) {
    return CollegeLocationModel(
      pk: json["pk"],
      name: json["name"],
      latitude: json["latitude"],
      longitude: json["longitude"],
      description: json["description"],
      type: json["location_type"],
    );
  }
}
