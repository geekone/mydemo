import 'package:flutter/material.dart';


class HomeDrawer extends StatelessWidget {

  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          ListTile(
            title: Text("新闻列表"),
            leading: Icon(Icons.list),
          )
        ],
      ),
    );
  }
}