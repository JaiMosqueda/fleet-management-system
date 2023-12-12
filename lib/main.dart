import 'package:fleet_management/Credentials/login.dart';
import 'package:fleet_management/Home/home_page.dart';
import 'package:fleet_management/Pages/schedule_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {

  await dotenv.load(fileName: ".env");

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Fleet Management System',
    theme: ThemeData(
      primarySwatch: Colors.lightGreen,
      scaffoldBackgroundColor: Colors.green
    ),
    home: LoginPage(),
  ));
}