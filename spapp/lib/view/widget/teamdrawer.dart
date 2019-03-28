import 'package:flutter/material.dart';


class TeamDrawer extends StatelessWidget {

  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          ListTile(
            title: Text("球队列表"),
            leading: Icon(Icons.list),
          )
        ],
      ),
    );
  }
}