import 'package:fleet_management/Credentials/login.dart';
import 'package:fleet_management/Pages/profile_page.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Fleet Management System',
    theme: ThemeData(
      primarySwatch: Colors.lightGreen,
      scaffoldBackgroundColor: Colors.green
    ),
    home: ProfilePage(),
  ));
}