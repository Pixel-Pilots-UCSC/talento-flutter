

import 'package:dio/dio.dart';

class APIProvider{
  final Dio _dio = Dio();

  static const String _baseUrl = 'http://10.0.2.2:4000/api';

  static get(String url, Options options, {Map<String, dynamic>? queryParameters}) async {
    final response = await Dio().get(
        _baseUrl + url,
        options: options,
        queryParameters:
        queryParameters
    );
    return response.data;
  }

  static post(String url,Object? data) async {
    final response = await Dio().post(
        _baseUrl + url,
        data: data
    );
    return response.data;
  }


}