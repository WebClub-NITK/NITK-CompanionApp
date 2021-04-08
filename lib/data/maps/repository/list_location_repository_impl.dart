import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:utilapp/application/failure/app_failure.dart';
import 'package:utilapp/application/network/network_info.dart';
import 'package:utilapp/data/maps/datasources/list_locations_remote_datasource.dart';
import 'package:utilapp/data/maps/model/location_model.dart';
import 'package:utilapp/domain/maps/entity/location.dart';
import 'package:utilapp/domain/maps/repository/get_list_locations_repository.dart';
import 'dart:convert';

class ListCollegeLocationsRepositoryImpl
    implements ListCollegeLocationsRepository {
  final NetworkInfo networkInfo;
  final ListCollegeLocationsRemoteDataSource remoteDataSource;
  ListCollegeLocationsRepositoryImpl({
    @required this.networkInfo,
    @required this.remoteDataSource,
  });

  @override
  Future<Either<AppFailure, List<CollegeLocation>>> getListOfLocations(
      bool fetchLocally) async {
    try {
      if (await networkInfo.isConnected) {
        final listOfCollegeLocationsModel =
            await remoteDataSource.getListOfCollegeLocations();
        print(listOfCollegeLocationsModel);
        if (listOfCollegeLocationsModel != AppFailure)
          return right(listOfCollegeLocationModelFromJson(
              json.decode(listOfCollegeLocationsModel.body)["results"]));
        else
          return left(listOfCollegeLocationsModel);
      } else {
        return left(AppFailure.InternetConnectionError);
      }
    } catch (e) {
      print(e);
      return left(AppFailure.ServerError);
    }
  }
}
