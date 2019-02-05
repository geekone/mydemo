import 'package:flutter/material.dart';
// import 'package:path/path.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:sqflite/sqflite.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'dart:io';

//***********************  用于一个drawer的练习 */
// import "./pages/home_page.dart";
// void main() => runApp(new MaterialApp(title: "app1",home: HomePage()));


//sqlfire mvp
import 'package:app1/mvp/pages/home_page.dart';
import 'package:app1/mvp/pages/login/login_page.dart';
void main() => runApp(MyApp());

//定义好路由
final routes = {
  '/home':(BuildContext context) => new HomePage(),
  '/login':(BuildContext context)=> new LoginPage(),
  '/':(BuildContext context) => new LoginPage()
};

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sqlfire Mvp',
      theme: ThemeData(
        primaryColor: Colors.teal,
      ),
      routes: routes,
    );
  }
}
