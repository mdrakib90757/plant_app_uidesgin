import 'package:flutter/material.dart';
import 'package:plant_app_project/Pages/details_page.dart';
import 'package:plant_app_project/Pages/home_page.dart';
import 'package:plant_app_project/Widgets/bottom_nav.dart';

import 'Pages/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

      ),
      home: SplashScreen()
    );
  }
}



