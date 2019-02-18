import 'package:flutter/material.dart';
import 'package:app1/pages/league_page.dart';
import 'package:app1/pages/team_page.dart';

//win113的tab页面
class WintabPage extends StatelessWidget {

  //定义上面的tabs
  final List<Tab> myTabs = <Tab>[
    new Tab(text: "League"),
    new Tab(text: "Team"),
  ];

  

  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Win113数据和TAB测试"),
          bottom: new TabBar(
            tabs: myTabs,
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            LeaguePage(),
            TeamPage(),
          ],
        )
        ),
      );
  }
}