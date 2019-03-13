import 'package:flutter/material.dart';

import 'package:win1/view/widget/HomeDrawer.dart';

/**
 * MainPage BottomTab 里面的首页
 */
class HomePage extends StatefulWidget {
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("HomePage")),
      drawer: HomeDrawer(),           //首页放一个独立出来的StatelessWidget,里面是 返回的 container 包住的 drawer
    );
  }
}