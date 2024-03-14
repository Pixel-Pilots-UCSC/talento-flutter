

import 'package:dio/dio.dart';

class APIProvider{
  final Dio _dio = Dio();

  static const String _baseUrl = 'http://10.0.2.2:4000/api';

  static get(String url, Options? options, {Map<String, dynamic>? queryParameters}) async {
    BaseOptions _options = BaseOptions(
      connectTimeout: const Duration(seconds: 7),
      headers: {
        "Content-Type": "application/json",
      },
    );
    final response = await Dio(
        _options
    ).get(
        _baseUrl + url,
        queryParameters:
        queryParameters
    );
    return response.data;
  }

  static post(String url,Object? data) async {
    try {
      BaseOptions options = BaseOptions(
        connectTimeout: const Duration(seconds: 7),
        headers: {
          "Content-Type": "application/json",
        },
      );
      final response = await Dio(
          options
      ).post(
          _baseUrl + url,
          data: data
      );
      return response.data;
    } on Exception catch (e) {
      //check if the error is a DioError and return the Response
      if (e is DioException) {
        if(e.type == DioExceptionType.badResponse){
          return e.response!.data;
        }
      }
    }

  }

  static void setToken(String token) {
    Dio().options.headers['Authorization'] = 'Bearer $token';
  }


}