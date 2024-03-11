

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:talento/models/auth_user.dart';
import 'package:talento/models/user_model.dart';
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
  getUserData(String id) async {
    BaseOptions options = BaseOptions(
      headers: {
        "Content-Type": "application/json",
      },
    );

    try {
      dynamic res = await APIProvider.get("/users/$id", null);
      UserModel user = UserModel.fromJson(res);
      return user;
    } on Exception catch (e) {
      print(e);
    }
  }

  void saveToken(String s) async{
    // save token to shared preferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
  }

  void saveUser(AuthUser authUser)async {
    // save user to shared preferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    UserModel userData = await getUserData(authUser.id!);
    print(userData);
    String userString = jsonEncode(userData);
    prefs.setString('user', userString);
    prefs.setString('token', authUser.token!);
    prefs.setString('role', authUser.role!);



  }




}