import 'dart:async';

import 'package:flutter/material.dart';
import 'package:talento/layout/main_layout.dart';
import 'package:talento/themes/theme_data.dart';

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
      home: checkAuthentication(),
    );
  }
}


