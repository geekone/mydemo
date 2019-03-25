import 'package:flutter/material.dart';

import 'package:mbb1/view/page/homepage.dart';
import 'package:mbb1/view/page/moviepage.dart';
import 'package:mbb1/view/page/aboutpage.dart';
// import 'package:sqflite/sqflite.dart';

/**
 * 首页是一个整合了 tab的页
 * 
 * 重点:
 *  Offstage的作用很简单，通过一个参数，来控制child是否显示，日常使用中也算是比较常用的控件。
 * 当offstage为true，当前控件不会被绘制在屏幕上，不会响应点击事件，也不会占用空间；
当offstage为false，当前控件则跟平常用的控件一样渲染绘制；
 *  级联符号（..）
 */
class MainPage extends StatefulWidget {

  MainPage({Key key}) : super(key: key);

  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _pageIndex = 0;       //当前BottomNavigationBar的第几个
  List _bodyPages = [];     //BottomNavigationBar包含的页面数组

  @override
  void initState() {
    super.initState();
    // 级联符号（..）
    _bodyPages
      ..add(new HomePage())
      ..add(new MoviePage())
      ..add(new AboutPage());

      //TODO Sqflite.platformVersion
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Offstage(
            child: _bodyPages[0],
            offstage: _pageIndex != 0,
          ),
           Offstage(
            child: _bodyPages[1],
            offstage: _pageIndex != 1,
          ),
          Offstage(
            child: _bodyPages[2],
            offstage: _pageIndex != 2,
          )
        ],
      ),
      bottomNavigationBar: Container(   //* 这里没有直接使用BottomNavigationBar，套了一层是为了设定高度
        height: 55,
        child: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home,size: 24.0),
              title: Text('首页',style: TextStyle(fontSize: 10))
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.movie,size: 24.0),
              title: Text('电影',style: TextStyle(fontSize: 10))
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home,size: 24.0),
              title: Text('社区',style: TextStyle(fontSize: 10))
            ),
          ],
          type: BottomNavigationBarType.fixed,
          currentIndex: _pageIndex,       //默认的是第一个页面
          onTap: (index){
            //* index表示选中了第几个
            setState((){
              _pageIndex = index;
            });
          },
        ),
      )
    );
  }
}