import 'package:flutter/material.dart';

class AboutDrawer extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Container(
      width: 240.0,
      child: Drawer(
        child: ListView(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.arrow_right),
              title: Text('事件列表'),
              onTap: (){
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      )
    );
  }
}