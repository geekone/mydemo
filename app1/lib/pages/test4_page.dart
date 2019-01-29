import "package:flutter/material.dart";



//https://www.jianshu.com/p/052bdb7349c2
//TODOList
class Test3Page extends StatefulWidget {
  @override
  _Test3PageState createState() => _Test3PageState();
}

class _Test3PageState extends State<Test3Page>{
   @override
    Widget build(BuildContext context) {
      return Scaffold(
            appBar: AppBar(
              title: Text('待办清单'),
            ),
            body: Container(
              padding: EdgeInsets.all(32.0),
              child: Center(
                child: Column(
                  children: <Widget>[],
                ),
              ),
            ),
            floatingActionButton: FloatingActionButton(
              tooltip: 'add todoitem',
              child: Icon(Icons.add),
              onPressed: null,
            ),
          );

    }
}