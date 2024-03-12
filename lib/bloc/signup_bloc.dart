

import 'package:talento/core/base_bloc.dart';
import 'package:talento/repositories/signup_repositories.dart';

import '../models/response.dart';

class SignupBloc extends BaseBloc<Response>{
  SignupRepositories _signupRepositories = SignupRepositories();

  void signup(String name,String email, String password) async {
    emit(Response.loading(''));
    try{
      var response = await _signupRepositories.signup(name,email, password);
      emit(Response.completed(response));
    }catch(e){
      emit(Response.error(e.toString()));
    }
  }
}
