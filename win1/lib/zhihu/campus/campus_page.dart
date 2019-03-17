import 'package:flutter/material.dart';


class CampusPage extends StatefulWidget {

  @override
  _CampusState createState() => _CampusState();
}

class _CampusState extends State<CampusPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Campus_page")),
      body: Center(child: Text("Campus_page"))
    );
  }
}