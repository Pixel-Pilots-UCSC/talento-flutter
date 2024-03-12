

import 'package:talento/core/base_bloc.dart';
import 'package:talento/models/auth_user.dart';
import 'package:talento/models/error_model.dart';
import 'package:talento/networking/api_provider.dart';
import 'package:talento/repositories/login_repositories.dart';

import '../models/response.dart';
import '../models/response_model.dart';

class LoginBloc extends BaseBloc<Response>{
  LoginRepositories _loginRepositories = LoginRepositories();

  void login(String email, String password) async {
    emit(Response.loading(''));
    try{
      var response = await _loginRepositories.login(email, password);
      ResponseModel r = ResponseModel.fromJson(response as Map<String, dynamic>);
      if(r.status == 'success'){
        AuthUser authUser = AuthUser.fromJson(r.data);
        // set token to dio header
        APIProvider.setToken(authUser.token!);
        // save token to shared preferences
        _loginRepositories.saveUser(authUser);
        emit(Response.completed(authUser));
      }else{
        emit(Response.error(r.message));
      }
    }catch(e){
      print(e);
      ErrorModel errorModel = ErrorModel.fromJson(e as Map<String, dynamic>);
      emit(Response.error(errorModel.message));
    }
  }
}
