import 'package:flutter/material.dart';



/**
 * 
 *  AutomaticKeepAliveClientMixin 是一个抽象状态，使用也很简单，我们只需要用我们自己的状态继承这个抽象状态，并实现 wantKeepAlive 方法即可。

继承这个状态后，widget在不显示之后也不会被销毁仍然保存在内存中，所以慎重使用这个方法。
 * 
 * 
 */

class CommunityPage extends StatefulWidget {

  _CommunityPageState createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage> with AutomaticKeepAliveClientMixin{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("CommunityPage")),
    );
  }

  @override
  bool get wantKeepAlive => true;
}