import "package:flutter/material.dart";
import './test1_page.dart';
import './test2_page.dart';
import './test3_page.dart';
import './todolist.dart';
import "package:app1/pages/listview_article.dart";
import "package:app1/pages/httppage.dart";
import "package:app1/pages/diopage.dart";
<<<<<<< HEAD
import "package:app1/pages/win113/win_home.dart";       //win113.com的一些页面
import "package:app1/pages/marquee_page.dart";
=======
import "package:app1/pages/wintabpage.dart";
>>>>>>> local

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
                  title: Text("Win113"),
                  subtitle: Text("win113的api"),
                  onTap:(){
                    Navigator.of(context).pop();
                    Navigator.of(context).push(MaterialPageRoute(builder: (context){ return WintabPage();}));
                  }
                ),
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
                ),
                ListTile(
                  title: Text("List View Article"),
                  onTap: (){
                    Navigator.of(context).pop();
                    Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext){ return ListViewArticle();}));
                  },  
                ),
                ListTile(
                  title: Text("测试http抓取数据包括加载"),
                  onTap: (){
                    Navigator.of(context).pop();
                    Navigator.of(context).push(MaterialPageRoute(builder: (context){ return HttpPage();}));
                  },
                ),
                 ListTile(
                  title: Text("测试dio抓取数据包括加载"),
                  onTap: (){
                    Navigator.of(context).pop();
                    Navigator.of(context).push(MaterialPageRoute(builder: (context){ return DioPage();}));
                  },
                ),
                ListTile(
                    title:Text("win113的页面"),
                    onTap: (){
                      Navigator.of(context).pop();
                      Navigator.of(context).push(MaterialPageRoute(builder: (context){return WinHome();}));
                    },
                ),
                ListTile(
                  title: Text("跑马灯"),
                  onTap: (){
                      Navigator.of(context).pop();
                      Navigator.of(context).push(MaterialPageRoute(builder: (context){return MarqueePage();}));
                  },
                ),
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