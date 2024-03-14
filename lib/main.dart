import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:talento/layout/main_layout.dart';
import 'package:talento/themes/theme_data.dart';
import 'package:talento/views/emp_job_post.dart';
import 'package:talento/views/employer_dash.dart';
import 'package:talento/views/profile_page.dart';
import 'package:talento/views/employee/dashboard_view.dart';
import 'package:talento/views/employee/filter_view.dart';
import 'package:talento/views/login_page.dart';
import 'package:talento/views/signup_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Widget checkAuthentication(){
    return MainLayout();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: Themes.lightTheme,
      darkTheme: Themes.darkTheme,
      builder: EasyLoading.init(),
      routes: {
        // '/': (context) => LoginPage(),
        '/' : (context) => SignupPage(),
        '/job-applicant' : (context) => MainLayout(),
        '/profile': (context) => ProfilePage(),
        '/job': (context) => EmployerDashboard(),
        // '/': (context) => SignupPage(),
        '/job-applicant' : (context) => DashboardView(),
        // '/job-employer' : (context) => checkAuthentication(),
      },
      initialRoute: '/',
    );
  }
}


