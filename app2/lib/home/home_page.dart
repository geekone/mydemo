import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:app2/myhome/home_page.dart';
import 'package:app2/idea/idea_page.dart';


class HomePage extends StatefulWidget {
  //TODO static String tag = 'home-page';      
  
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _tabIndex = 0;  //当前选择的tab的默认索引
  //TODO bool isFinishSetup = false;
  
  //没有点中的下面的TAB的图标widget和色彩
  List<Icon> _tabImages = [
    Icon(Icons.view_list,size:25.0,color: Colors.grey,),
    Icon(Icons.touch_app,size:25.0,color:Colors.grey),
  ];

  //点中后的图标组色彩
  List<Icon> _tabSelectedImages =[
    Icon(Icons.view_list, size: 25.0, color: Colors.blue,),
    Icon(Icons.touch_app, size: 25.0, color: Colors.blue,),
  ];
  

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      //没有appbar,并且压了一组按索引的页面组件
      body: IndexedStack(
        children: <Widget>[
          MyHomePage(),
          IdeaPage(),
        ],
        index: _tabIndex,     //这里索引对应着下面的TAB
      ),
      bottomNavigationBar:CupertinoTabBar(
        backgroundColor: Colors.white,
        activeColor: Colors.teal,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon:getBottomBarItemIcon(0),title:Text('首页')),
          BottomNavigationBarItem(icon:getBottomBarItemIcon(1),title:Text('想法')),
        ],
        currentIndex: _tabIndex,
        onTap: (index){
          setState(() {
            _tabIndex = index;
          });
        },
      ),
      
    );
  }

  //用于下面的tabbar的图标变色,对应主要 _tabIndex素引
  Icon getBottomBarItemIcon(int index){
    if (index == _tabIndex){
      return _tabSelectedImages[index];
    }else{
      return _tabImages[index];
    }
  }


  // List<Recommend> modules = [];


  // Future<void> fetchData() async{
  //   var responseJson = await Request.get(action: "myhome_recommend");         //抓取的是mock的数据
  //   List<Recommend> modules = [];
  //   responseJson.forEach( (data) {
  //     modules.add(Recommend.fromJson(data));
  //   });

  //   print(modules.length);
  //   print(modules[0].id);
  // }
  



  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   print("-------------");
  //   fetchData();      //初始的时先抓取一下数据
  // }   

 
}