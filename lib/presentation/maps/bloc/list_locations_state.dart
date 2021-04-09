part of 'list_locations_bloc.dart';

@freezed
abstract class ListCollegeLocationsState with _$ListCollegeLocationsState {
  const factory ListCollegeLocationsState.initial() = Initial;
  const factory ListCollegeLocationsState.loadListOfCollegeLocations(
      List<CollegeLocation> bookingList) = LoadListOfCollegeLocations;
  const factory ListCollegeLocationsState.failure(AppFailure failure) = Failure;
  // const factory ListCollegeLocationsState.loadCollegeLocationDetails(CollegeLocationDetails bookingDetails) = LoadCollegeLocationDetails;
}
