import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:utilapp/application/failure/app_failure.dart';
import 'package:utilapp/application/network/network_info.dart';
import 'package:utilapp/data/maps/datasources/list_locations_local_datasource.dart';
import 'package:utilapp/data/maps/datasources/list_locations_remote_datasource.dart';
import 'package:utilapp/domain/maps/entity/location.dart';
import 'package:utilapp/domain/maps/repository/get_list_locations_repository.dart';

class ListCollegeLocationsRepositoryImpl
    implements ListCollegeLocationsRepository {
  final NetworkInfo networkInfo;
  final ListCollegeLocationsRemoteDataSource remoteDataSource;
  final FetchCollegeLocationLocalDataSource localDataSource;
  ListCollegeLocationsRepositoryImpl(
      {@required this.networkInfo,
      @required this.remoteDataSource,
      @required this.localDataSource});

  @override
  Future<Either<AppFailure, List<CollegeLocation>>> getListOfLocations(
      bool fetchLocally) async {
    try {
      if (await networkInfo.isConnected) {
        final listOfCollegeLocationsModel =
            await remoteDataSource.getListOfCollegeLocations();
        return right(listOfCollegeLocationsModel);
      } else {
        return left(AppFailure.InternetConnectionError);
      }
    } catch (e) {
      return left(AppFailure.ServerError);
    }
  }
}
