part of 'list_locations_bloc.dart';

@freezed
abstract class ListCollegeLocationsEvent with _$ListCollegeLocationsEvent {
  const factory ListCollegeLocationsEvent.getListOfCollegeLocations() =
      GetListOfCollegeLocations;
}
