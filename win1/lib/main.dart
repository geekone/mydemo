import 'package:flutter/material.dart';
import 'package:win1/view/page/MainPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  //TODO store

  @override
  Widget build(BuildContext context) {
    //TODO store
    return MaterialApp(
      title: 'Win7',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainPage(),
    );
  }
}

