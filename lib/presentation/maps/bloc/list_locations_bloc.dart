import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:utilapp/application/failure/app_failure.dart';
import 'package:utilapp/application/usecase/usecase.dart';
import 'package:utilapp/domain/maps/entity/location.dart';
import 'package:utilapp/domain/maps/repository/get_list_locations_repository.dart';
import 'package:utilapp/domain/maps/usecase/get_list_of_locations.dart';

part 'list_locations_event.dart';
part 'list_locations_state.dart';
part 'list_locations_bloc.freezed.dart';

class ListCollegeLocationsBloc
    extends Bloc<ListCollegeLocationsEvent, ListCollegeLocationsState> {
  ListCollegeLocationsRepository listCollegeLocationsRepository;
  final GetListOfCollegeLocationsImpl getListOfCollegeLocations;

  ListCollegeLocationsBloc({
    @required this.getListOfCollegeLocations,
  }) : super(null);

  @override
  ListCollegeLocationsState get initialState =>
      ListCollegeLocationsState.initial();

  @override
  Stream<ListCollegeLocationsState> mapEventToState(
    ListCollegeLocationsEvent event,
  ) async* {
    if (event is GetListOfCollegeLocations) {
      final res = await getListOfCollegeLocations
          .call(GetListOfCollegeLocationsParams(fetchLocally: false));
      yield* res.fold((failure) async* {
        yield ListCollegeLocationsState.failure(failure);
        final storedResult = await getListOfCollegeLocations(
            GetListOfCollegeLocationsParams(fetchLocally: false));
        yield storedResult.fold((failure) {
          return ListCollegeLocationsState.failure(failure);
        }, (storedCollegeLocations) {
          return ListCollegeLocationsState.loadListOfCollegeLocations(
              storedCollegeLocations);
        });
      }, (list) async* {
        yield ListCollegeLocationsState.loadListOfCollegeLocations(list);
      });
    }
  }
}
