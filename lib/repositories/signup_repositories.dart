

import 'package:dio/dio.dart';
import 'package:talento/networking/api_provider.dart';

class SignupRepositories{
  APIProvider _provider = APIProvider();

  signup(String name,String email, String password,String confirmPassword) {
    BaseOptions options = BaseOptions(
      headers: {
        "Content-Type": "application/json",
      },
    );
    Object data = {
      "name":name,
      "email": email,
      "password": password,
      "confirm_password": confirmPassword,
      "role": "employer"
    };
    dynamic res = APIProvider.post("/auth/signup", data);
    return res;
  }




}