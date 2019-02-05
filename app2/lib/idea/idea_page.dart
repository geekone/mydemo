import 'package:flutter/material.dart';


class IdeaPage extends StatefulWidget{
  @override
  _IdeaPageState createState() => _IdeaPageState();
}


// with SingleTickerProviderStateMixin 是为了过度动画用的
class _IdeaPageState extends State<IdeaPage> with SingleTickerProviderStateMixin{

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text("IDEA PAGE"),),
      body: Center(child: Text('IDEA Page'),),
    );
  }

}