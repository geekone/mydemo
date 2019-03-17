import 'package:flutter/material.dart';


class MePage extends StatefulWidget {

  @override
  _MeState createState() => _MeState();
}

class _MeState extends State<MePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("me_page")),
      body: Center(child: Text("me_page"))
    );
  }
}