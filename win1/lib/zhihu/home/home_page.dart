import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

//5个页面
import 'package:win1/zhihu/myhome/home_page.dart';
import 'package:win1/zhihu/me/me_page.dart';
import 'package:win1/zhihu/idea/idea_page.dart';
import 'package:win1/zhihu/message/message_page.dart';
import 'package:win1/zhihu/campus/campus_page.dart';

//程序的首页，包含bottom tab的
class HomePage extends StatefulWidget {
  //TODO tag
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _tabIndex = 0;      //默认选取的TAB和当前页用的
  
  //两个数组用于显示底部图标的触发状态
  List<Icon> _tabImages = [
    Icon(Icons.view_list, size: 25.0, color: Colors.grey,),
    Icon(Icons.touch_app, size: 25.0, color: Colors.grey,),
    Icon(Icons.school, size: 25.0, color: Colors.grey,),
    Icon(Icons.notifications, size: 25.0, color: Colors.grey,),
    Icon(Icons.person, size: 25.0, color: Colors.grey,),
  ];
  List<Icon> _tabSelectedImages = [
    Icon(Icons.view_list, size: 25.0, color: Colors.blue,),
    Icon(Icons.touch_app, size: 25.0, color: Colors.blue,),
    Icon(Icons.school, size: 25.0, color: Colors.blue,),
    Icon(Icons.notifications, size: 25.0, color: Colors.blue,),
    Icon(Icons.person, size: 25.0, color: Colors.blue,),
  ];


  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(     //* 使用IndexedStack就不用 Stack Offstage 隐藏了，具体的看 tag dev0.1
        children: <Widget>[
          MyHomePage(),
          IdeaPage(),
          CampusPage(),
          MessagePage(),
          MePage(),
        ],
        index: _tabIndex,
      ),
      bottomNavigationBar: CupertinoTabBar(
        backgroundColor: Colors.white,
        activeColor: Colors.teal,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: getTabIcon(0), title: Text('首页')),
          BottomNavigationBarItem(icon: getTabIcon(1), title: Text('想法')),
          BottomNavigationBarItem(icon: getTabIcon(2), title: Text('大学')),
          BottomNavigationBarItem(icon: getTabIcon(3), title: Text('消息')),
          BottomNavigationBarItem(icon: getTabIcon(4), title: Text('我')),
        ],
        currentIndex: _tabIndex,
        onTap: (index) {
          setState(() {
            _tabIndex = index;
          });
        },
        ),
    );
  }

  Icon getTabIcon(int index) {
    if (index == _tabIndex) {
      return _tabSelectedImages[index];
    } else {
      return _tabImages[index];
    }
  }


}