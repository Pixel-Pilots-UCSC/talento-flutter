

import 'package:dio/dio.dart';

class APIProvider{
  final Dio _dio = Dio();

  static const String _baseUrl = 'https://api.coincap.io/v2/';

  static get(String url, Options options, {Map<String, dynamic>? queryParameters}) async {
    final response = await Dio().get(
        _baseUrl + url,
        options: options,
        queryParameters:
        queryParameters
    );
    return response.data;
  }

  static post(String url, Options options, Object? data) async {
    final response = await Dio().post(
        _baseUrl + url,
        options: options,
        data: data
    );
    return response.data;
  }


}