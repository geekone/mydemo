import 'package:flutter/material.dart';


class MessagePage extends StatefulWidget {

  @override
  _MessageState createState() => _MessageState();
}

class _MessageState extends State<MessagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Message_page")),
      body: Center(child: Text("Message_page"))
    );
  }
}