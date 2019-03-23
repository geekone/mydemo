import 'package:flutter/material.dart';

//包的的应用部分 
import 'package:air1/pages/shared.dart';
import 'package:air1/pages/diopage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(title: '笔记本学习用'),
    );
  }
}

class HomePage extends StatelessWidget {
  final String title;

  HomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(this.title),centerTitle: true),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            ListTile(
              title: Text('Shared存储'),
              trailing: Icon(Icons.arrow_right,color: Colors.red),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(builder: (context){ return SharedPage(title: 'Shared存储');}));
              },
            ),
            ListTile(
              title: Text('Dio封装测试'),
              trailing: Icon(Icons.arrow_right,color: Colors.red),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(builder: (context){ return DioPage(title: 'Dio封装测试');}));
              },
            ),
          ],
        ),
      ),
      body: Container(
        child: Center(
          child: Text("首页"),
        ),
      ),
    );
  }
}