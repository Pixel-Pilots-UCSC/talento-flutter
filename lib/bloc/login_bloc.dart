

import 'package:talento/core/base_bloc.dart';
import 'package:talento/repositories/login_repositories.dart';

import '../models/response.dart';

class LoginBloc extends BaseBloc<Response>{
  LoginRepositories _loginRepositories = LoginRepositories();

  void login(String email, String password) async {
    emit(Response.loading(''));
    try{
      var response = await _loginRepositories.login(email, password);
      emit(Response.completed(response));
    }catch(e){
      emit(Response.error(e.toString()));
    }
  }
}
