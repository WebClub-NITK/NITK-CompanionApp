import 'package:dio/dio.dart';
import 'package:utilapp/application/failure/app_failure.dart';

class NetworkClient {
  Dio dio = new Dio();
  dynamic getRequest({String url, dynamic queryParameters}) async {
    try {
      var response = await Dio().get(
        'url',
        queryParameters: queryParameters,
      );
      return response;
    } catch (e) {
      return AppFailure.ServerError;
    }
  }
}
