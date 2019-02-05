import 'package:flutter/material.dart';
import 'package:app2/myhome/myhome_list.dart';

class MyHomePage extends StatefulWidget{
  @override
  _MyHomePageState createState() => _MyHomePageState();
}


// with SingleTickerProviderStateMixin 是为了过度动画用的
class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin{

  TabController _tabController;     //必须有这个,使用在Appbar 里面  TabBar组件时

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(vsync: this,initialIndex: 1,length: 4);    //初始一下controller
  }

  @override
  void dispose() {
    _tabController.dispose();     //页面销毁时，销毁控制器
    super.dispose();
  }

  final loginButton = FlatButton.icon(
      onPressed: () {},
      icon: Icon(
        Icons.mode_edit,
        size: 20.0,
        color: Colors.blue,
      ),
      label: Text(
        "提问",
        style: TextStyle(color: Colors.blue, fontSize: 18.0),
      ));

  //最上面的搜索组件
  Widget barSearch() {
    return new Row(
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: new FlatButton.icon(
              color: Colors.black12,
              onPressed: () {},
              icon: new Icon(
                Icons.search,
                size: 18.0,
                color: Colors.grey,
              ),
              label: new Text(
                "搜索",
                style: new TextStyle(color: Colors.grey, fontSize: 16.0),
              ),
            ),
          ),
        ),
        loginButton
      ],
    );
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: barSearch(),
        elevation: 0,
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.black,
          tabs: <Widget>[
             Tab(text: "关注"),
             Tab(text: "推荐"),
             Tab(text: "热情"),
             Tab(text: "视频"),
          ],

        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          Text("aa"),
          MyHomeListView(),
          Text("c"),
          Text("d"),

        ],
      )
    );
  }

}