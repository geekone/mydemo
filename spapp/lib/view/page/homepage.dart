import 'package:flutter/material.dart';

import 'package:spapp/view/widget/homedrawer.dart';



class HomePage extends StatelessWidget {
  HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            title: Text('HomePage'),
          ),
          drawer: HomeDrawer(),
          body: Container(
            padding: EdgeInsets.all(32.0),
            child: Center(
              child: Column(
                children: <Widget>[],
              ),
            ),
          ),
        );
    
  }
}