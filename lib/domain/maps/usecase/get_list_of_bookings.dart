import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:utilapp/application/failure/app_failure.dart';
import 'package:utilapp/application/usecase/usecase.dart';
import 'package:utilapp/domain/maps/entity/location.dart';
import 'package:utilapp/domain/maps/repository/get_list_locations_repository.dart';

class GetListOfCollegeLocationsImpl
    implements
        Usecase<List<CollegeLocation>, GetListOfCollegeLocationsParams,
            AppFailure> {
  final ListCollegeLocationsRepository listCollegeLocationsRepository;

  GetListOfCollegeLocationsImpl(this.listCollegeLocationsRepository);

  @override
  Future<Either<AppFailure, List<CollegeLocation>>> call(
      GetListOfCollegeLocationsParams getListOfCollegeLocationsParams) async {
    return (await listCollegeLocationsRepository
        .getListOfLocations(getListOfCollegeLocationsParams.fetchLocally));
  }
}

class GetListOfCollegeLocationsParams {
  final bool fetchLocally;

  GetListOfCollegeLocationsParams({@required this.fetchLocally});
}
