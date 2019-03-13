import 'package:flutter/material.dart';

class SharedPage extends StatefulWidget {
  final String title;

  SharedPage({Key key,this.title}) : super(key: key);

  _SharedPageState createState() => _SharedPageState();
}

class _SharedPageState extends State<SharedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(this.widget.title),centerTitle: true),
      body: Container(
        padding: EdgeInsets.all(30.0),
        child: Text('Shared'),
      ),
    );
  }
}