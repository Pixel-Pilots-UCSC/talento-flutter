// import 'dart:convert';

// import 'package:dio/dio.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:talento/models/about_user.dart';
// import 'package:talento/networking/api_provider.dart';

// class ProfileRepositories{
//   APIProvider _provider = APIProvider();

//   about(String name,String dob, String email) {
//     BaseOptions options = BaseOptions(
//       headers: {
//         "Content-Type": "application/json",
//       },
//     );
//     Object data = {
//       "name":name,
//       "dob": dob,
//       "email": email,
//     };
//     dynamic res = APIProvider.post("/auth/profile/", data);
//     return res;
//   }

//   void saveUser(AboutUser authUser)async {
//     // save user to shared preferences
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     // AboutUser aboutData = await about(authUser.id!);
//     // print(aboutData);
//     // String aboutString = jsonEncode(aboutData);
//     // prefs.setString('about', aboutString);
//     // // prefs.setString('token', authUser.token!);
//     // prefs.setString('role', authUser.role!);



//   }
// }