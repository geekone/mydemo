import 'package:flutter/material.dart';


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            title: Text('Homepage'),
          ),
          body: Container(
            padding: EdgeInsets.all(32.0),
            child: Center(
              child: Column(
                children: <Widget>[
                  Text("Home Page")
                ],
              ),
            ),
          ),
        );
    
  }
}