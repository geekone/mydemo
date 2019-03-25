import 'package:flutter/material.dart';

import 'package:mbb1/view/widget/aboutdrawer.dart';

/**
 * MainPage BottomTab 里面的首页
 */
class AboutPage extends StatefulWidget {
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> with SingleTickerProviderStateMixin{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("AboutPage")),
      drawer: AboutDrawer(),           //首页放一个独立出来的StatelessWidget,里面是 返回的 container 包住的 drawer
      body: Center(
        child: Text("MV"),
      ),
    );
  }
}