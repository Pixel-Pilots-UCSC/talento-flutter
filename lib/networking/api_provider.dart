

import 'package:dio/dio.dart';

class APIProvider{
  final Dio _dio = Dio();

  static const String _baseUrl = 'http://10.0.2.2:4000/api';

  static get(String url, Options? options, {Map<String, dynamic>? queryParameters}) async {
    final response = await Dio().get(
        _baseUrl + url,
        options: options,
        queryParameters:
        queryParameters
    );
    return response.data;
  }

  static post(String url,Object? data) async {
    try {
      final response = await Dio().post(
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