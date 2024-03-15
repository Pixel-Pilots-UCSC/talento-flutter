// import 'package:talento/core/base_bloc.dart';
// import 'package:talento/models/about_user.dart';
// import 'package:talento/models/response.dart';
// import 'package:talento/models/response_model.dart';
// import 'package:talento/models/user_model.dart';
// import 'package:talento/networking/api_provider.dart';
// import 'package:talento/repositories/login_repositories.dart';
// import 'package:talento/repositories/profile_repositories.dart';

// class AboutBloc extends BaseBloc<Response> {

//   LoginRepositories _loginRepositories = LoginRepositories();
//    void savedata(String name,String dob, String email ) async {
//     emit(Response.loading(''));
//     try {
//       // get about data
// var response = await _loginRepositories.about(name,email, dob);
//       ResponseModel r = ResponseModel.fromJson(response as Map<String, dynamic>);
//       if(r.status == 'success'){
//         UserModel userModel = UserModel.fromJson(r.data);
//         // set token to dio header
//         // APIProvider.setToken(authUser.token!);
//         // save token to shared preferences
//         _loginRepositories.saveUser(userModel);
//         emit(Response.completed(userModel));
//       }else {
//         emit(Response.error(r.message));
//       }    } catch (e) {
//       emit(Response.error(e.toString()));
//     }

// }
// }
