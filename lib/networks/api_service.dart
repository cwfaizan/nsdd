import 'package:dio/dio.dart';

import 'network_client.dart';

class ApiService {
  final NetworkClient networkClient;

  ApiService({required this.networkClient});

  Future<Response> getCountries() {
    return networkClient.get('/countries');
  }

  Future<Response> getProvinces(Map<String, dynamic>? params) {
    return networkClient.get('/provinces', params: params);
  }

  Future<Response> getCities(Map<String, dynamic>? params) {
    return networkClient.get('/cities', params: params);
  }

  //http post
  Future<Response> postSignupForm(Map<String, dynamic> params) {
    return networkClient.post('/signup', params);
  }
}
