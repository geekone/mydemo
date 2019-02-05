import "package:flutter/material.dart";
import './test1_page.dart';
import './test2_page.dart';
import './test3_page.dart';
import './todolist.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            title: Text('首页'),
          ),
          drawer: Drawer(
            child: ListView(
              children: <Widget>[
                ListTile(
                  title: Text("测试Flex布局"),
                  onTap: (){
                    Navigator.of(context).pop();
                    Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext){ return Test1Page();}));
                  }),
                ListTile(
                  title:Text("构建布局实例"),
                  onTap: (){
                    Navigator.of(context).pop();
                    Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext){ return Test2Page();}));
                  }
                ),
                ListTile(
                  title:Text("顶部导航栏加网络请求的基本使用"),
                  onTap: (){
                    Navigator.of(context).pop();
                    Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext){ return Test3Page();}));
                  }
                ),
                 ListTile(
                  title:Text("TODO List"),
                  onTap: (){
                    Navigator.of(context).pop();
                    Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext){ return TodoList();}));
                  }
                )
              ],
            ),
          ),
          body: Container(
            padding: EdgeInsets.all(32.0),
            child: Center(
              child: Column(
                children: <Widget>[
                  Text("首页")
                ],
              ),
            ),
          ),
        );
    
  }
}