import 'package:flutter/material.dart';

class HomeDrawer extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Container(
      width: 240.0,
      child: Drawer(
        child: ListView(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.arrow_right),
              title: Text('使用中'),
              onTap: (){
                
              },
            ),
          ],
        ),
      )
    );
  }
}