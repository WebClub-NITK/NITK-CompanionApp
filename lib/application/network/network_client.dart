import 'package:dio/dio.dart';
import 'package:utilapp/application/failure/app_failure.dart';
import 'package:http/http.dart' as http;

class NetworkClient {
  String domain = 'daf2edcede40.ngrok.io';
  //String domain = '127.0.0.1:8000';
  Dio dio = new Dio();
  dynamic getRequest({String url, dynamic queryParameters}) async {
    print(url);
    Uri toGet = Uri.http(domain, url);
    print(toGet);
    try {
      var response = await http.get(toGet);
      return response;
    } catch (e) {
      return AppFailure.ServerError;
    }
  }
}
