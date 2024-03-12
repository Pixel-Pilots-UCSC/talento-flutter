// import 'package:talento/core/base_bloc.dart';
// import 'package:talento/models/response.dart';
// import 'package:talento/models/user_model.dart';
// import 'package:talento/repositories/login_repositories.dart';

// class ProfileBloc extends BaseBloc<Response<Profile>> {
// LoginRepositories _loginRepositories = LoginRepositories();

//   void getProfile() async {
//     emit(Response.loading(''));
//     try {
//       var response = await _loginRepositories.getUserData(id);
//       Profile profile = Profile.fromJson(response as Map<String, dynamic>);
//       emit(Response.completed(profile));
//     } catch (e) {
//       print(e);
//       emit(Response.error(e.toString()));
//     }
//   }

//   // void updateProfile(Profile profile) async {
//   //   emit(Response.loading(''));
//   //   try {
//   //     var response = await _profileRepositories.updateProfile(profile);
//   //     Profile profile = Profile.fromJson(response as Map<String, dynamic>);
//   //     emit(Response.completed(profile));
//   //   } catch (e) {
//   //     print(e);
//   //     emit(Response.error(e.toString()));
//   //   }
//   // }

//   // void uploadImage(File image) async {
//   //   emit(Response.loading(''));
//   //   try {
//   //     var response = await _profileRepositories.uploadImage(image);
//   //     Profile profile = Profile.fromJson(response as Map<String, dynamic>);
//   //     emit(Response.completed(profile));
//   //   } catch (e) {
//   //     print(e);
//   //     emit(Response.error(e.toString()));
//   //   }
//   // }
// }