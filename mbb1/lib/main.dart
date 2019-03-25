import 'package:flutter/material.dart';
import 'package:mbb1/view/page/mainpage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  //TODO store

  @override
  Widget build(BuildContext context) {
    //TODO store
    return MaterialApp(
      title: 'mbb1',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainPage(),
    );
  }
}
