

import 'package:dio/dio.dart';
import 'package:talento/networking/api_provider.dart';

class LoginRepositories{
  APIProvider _provider = APIProvider();

  login(String email, String password) {
    BaseOptions options = BaseOptions(
      headers: {
        "Content-Type": "application/json",
      },
    );
    Object data = {
      "email": email,
      "password": password
    };
    dynamic res = APIProvider.post("/auth/signin", data);
    return res;
  }




}