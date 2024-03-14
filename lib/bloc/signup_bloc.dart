

import 'package:talento/core/base_bloc.dart';
import 'package:talento/repositories/login_repositories.dart';
import 'package:talento/repositories/signup_repositories.dart';

import '../models/auth_user.dart';
import '../models/response.dart';
import '../models/response_model.dart';
import '../networking/api_provider.dart';

class SignupBloc extends BaseBloc<Response>{
  SignupRepositories _signupRepositories = SignupRepositories();
  LoginRepositories _loginRepositories = LoginRepositories();

  void signup(String name,String email, String password,String confirmPassword) async {
    emit(Response.loading(''));
    try{
      var response = await _signupRepositories.signup(name,email, password,confirmPassword);
      ResponseModel r = ResponseModel.fromJson(response as Map<String, dynamic>);
      if(r.status == 'success'){
        AuthUser authUser = AuthUser.fromJson(r.data);
        // set token to dio header
        APIProvider.setToken(authUser.token!);
        // save token to shared preferences
        _loginRepositories.saveUser(authUser);
        emit(Response.completed(authUser));
      }else {
        emit(Response.error(r.message));
      }
    }catch(e){
      emit(Response.error(e.toString()));
    }
  }
}
