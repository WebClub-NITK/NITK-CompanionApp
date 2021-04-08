import 'package:dio/dio.dart';
import 'package:utilapp/application/failure/app_failure.dart';
import 'package:http/http.dart' as http;

class NetworkClient {
  String domain = '10.0.2.2:8000';

  Dio dio = new Dio();
  dynamic getRequest({String url, dynamic queryParameters}) async {
    print(url);
    try {
      var response = await http.get(Uri.http(domain, url));
      print(response.body);
      return response;
    } catch (e) {
      return AppFailure.ServerError;
    }
  }
}
