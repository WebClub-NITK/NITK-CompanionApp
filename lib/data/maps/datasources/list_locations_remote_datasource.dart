import 'package:utilapp/application/network/network_client.dart';
import 'package:utilapp/data/maps/model/location_model.dart';

abstract class ListCollegeLocationsRemoteDataSource {
  Future<dynamic> getListOfCollegeLocations();
}

class ListCollegeLocationsRemoteDataSourceImpl
    implements ListCollegeLocationsRemoteDataSource {
  final NetworkClient networkClient;

  ListCollegeLocationsRemoteDataSourceImpl(this.networkClient);

  @override
  Future<dynamic> getListOfCollegeLocations() async {
    final response = await networkClient.getRequest(url: '/locations.json');
    return response;
  }
}
