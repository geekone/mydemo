import 'package:flutter/material.dart';


//样式
import 'package:win1/pages/styles/pageviewpage.dart';
import 'package:win1/pages/styles/pageviewpage2.dart';

class HomePage extends StatelessWidget {
  final String title;

  HomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(this.title),centerTitle: true),
      drawer: Drawer(
        child: ListView(
          // padding: const EdgeInsets.all(8.0),
          children: <Widget>[
            ListTile(
              title: Text("关于各种类的测试"),
              trailing: Icon(Icons.list,color:Colors.red)
            ),
            Divider(height: 2.0,color: Colors.blue),
            Container(
              padding: const EdgeInsets.only(left: 18.0),   //*包一个container 并且 左边空开，分隔开ListTile与主标题
              child: Column(
                // mainAxisSize: MainAxisSize.min,
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ListTile(
                    title: Text("测试缓存shared",style: TextStyle(fontSize: 10.0)),         //字体图标缩小
                    trailing: Icon(Icons.arrow_right,color: Colors.green,size: 14.0),
                  ),
                  ListTile(
                    title: Text("测试缓存shared",style: TextStyle(fontSize: 10.0)),
                    trailing: Icon(Icons.arrow_right,color: Colors.green,size: 14.0),
                  ),
                  ListTile(
                    // contentPadding:EdgeInsets.all(2.0),       //ListTile 的内边剧
                    title: Text("测试缓存shared",style: TextStyle(fontSize: 10.0)),
                    trailing: Icon(Icons.arrow_right,color: Colors.green,size: 14.0),
                  )
                ],
              ),
            ),
            
            ListTile(
              title: Text("关于各种样式的测试"),
              trailing: Icon(Icons.list,color:Colors.red)
            ),
            Divider(height: 2.0,color: Colors.blue),
            Container(
              padding: const EdgeInsets.only(left: 18.0),   //*包一个container 并且 左边空开，分隔开ListTile与主标题
              child: Column(
                // mainAxisSize: MainAxisSize.min,
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ListTile(
                    title: Text("测试基本ViewPage",style: TextStyle(fontSize: 10.0)),        
                    trailing: Icon(Icons.arrow_right,color: Colors.green,size: 14.0),
                    onTap: (){
                      Navigator.of(context).pop();
                      Navigator.of(context).push( new MaterialPageRoute( builder:(context){ return PageViewPage(title: "测试基本ViewPage");}));
                    },
                  ),
                  ListTile(
                    title: Text("pageview的第二个例子",style: TextStyle(fontSize: 10.0)),
                    trailing: Icon(Icons.arrow_right,color: Colors.green,size: 14.0),
                     onTap: (){
                      Navigator.of(context).pop();
                      Navigator.of(context).push( new MaterialPageRoute( builder:(context){ return PageViewPage2(title: "pageview的第二个例子");}));
                    },
                  ),
                  ListTile(
                    // contentPadding:EdgeInsets.all(2.0),       //ListTile 的内边剧
                    title: Text("测试缓存shared",style: TextStyle(fontSize: 10.0)),
                    trailing: Icon(Icons.arrow_right,color: Colors.green,size: 14.0),
                  )
                ],
              ),
            ),




          ],
        ),
      ),
      body: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            MaterialButton(
              child: Text("Click"),
            ),
            MaterialButton(
              child: Text("Click"),
            )
          ],
        ),
      ),
    );
  }
}