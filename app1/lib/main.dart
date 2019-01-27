import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sqflite/sqflite.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';
void main() => runApp(new MaterialApp(title: "app1",home: MyApp()));


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  
  List<int> items = List.generate(16, (i) => i);  //List.generate（）方法来创建了一个长度为16的List，

  Future<Null> _handleRefresh() async {
    await Future.delayed(Duration(seconds: 5), () {
      print('refresh');
      setState(() {
        items.clear();
        items = List.generate(40, (i) => i);      //这里会改变，所以上面不能是final
        return null;
      });
    });
  }


  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(title:Text("ListView")),
      body: RefreshIndicator(
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (BuildContext context,index){
            return ListTile(
              title: Text("Index$index"),
            );
          },
        ),
        onRefresh: _handleRefresh,
      )
    );
  }
}

