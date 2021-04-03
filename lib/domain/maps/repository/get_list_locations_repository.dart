import 'package:dartz/dartz.dart';
import 'package:utilapp/application/failure/app_failure.dart';

import '../entity/location.dart';

abstract class ListCollegeLocationsRepository {
  Future<Either<AppFailure, List<CollegeLocation>>> getListOfLocations(
      bool fetchLocally);
}
