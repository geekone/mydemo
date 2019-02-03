import 'package:flutter/material.dart';
import 'otherpage.dart';

class Homepage extends StatefulWidget{
  
      @override
      _HomepageState createState()=> _HomepageState();
}


class _HomepageState extends State<Homepage>{

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text("CYC"),backgroundColor: Colors.redAccent),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
             new UserAccountsDrawerHeader(   //Material内置控件
              accountName: new Text('CYC'), //用户名
              accountEmail: new Text('example@126.com'),  //用户邮箱
              currentAccountPicture: new GestureDetector( //用户头像
                onTap: () => print('current user'),
                child: new CircleAvatar(    //圆形图标控件
                  backgroundImage: new NetworkImage('https://upload.jianshu.io/users/upload_avatars/7700793/dbcf94ba-9e63-4fcf-aa77-361644dd5a87?imageMogr2/auto-orient/strip|imageView2/1/w/240/h/240'),//图片调取自网络
                ),
              ),
              otherAccountsPictures: <Widget>[    //粉丝头像
                new GestureDetector(    //手势探测器，可以识别各种手势，这里只用到了onTap
                  onTap: () => print('other user'), //暂且先打印一下信息吧，以后再添加跳转页面的逻辑
                  child: new CircleAvatar(
                    backgroundImage: new NetworkImage('https://upload.jianshu.io/users/upload_avatars/10878817/240ab127-e41b-496b-80d6-fc6c0c99f291?imageMogr2/auto-orient/strip|imageView2/1/w/240/h/240'),
                  ),
                ),
                new GestureDetector(
                  onTap: () => print('other user'),
                  child: new CircleAvatar(
                    backgroundImage: new NetworkImage('https://upload.jianshu.io/users/upload_avatars/8346438/e3e45f12-b3c2-45a1-95ac-a608fa3b8960?imageMogr2/auto-orient/strip|imageView2/1/w/240/h/240'),
                    ),
                ),
              ],
              decoration: new BoxDecoration(    //用一个BoxDecoration装饰器提供背景图片
                image: new DecorationImage(
                  fit: BoxFit.fill,
                  // image: new NetworkImage('https://raw.githubusercontent.com/flutter/website/master/_includes/code/layout/lakes/images/lake.jpg')
                  //可以试试图片调取自本地。调用本地资源，需要到pubspec.yaml中配置文件路径
                  image: new ExactAssetImage('images/lake.jpg'),
                ),
              ),
            ),

          ListTile(
            title:Text("First Page"),
            trailing: Icon(Icons.arrow_upward),
            onTap: () {
              Navigator.of(context).pop();  //点击后收起侧边栏
              Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new OtherPage('First Page')));  //进入OtherPage页面，传入参数First Page
            }
          ),
          ListTile(
            title: Text("Second Page"),
            trailing: Icon(Icons.arrow_right),
            onTap: (){
              Navigator.of(context).pop();
              Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new OtherPage('Second Page')));
    
            },
          ),
          Divider(),
          ListTile(
            title: Text('Close'),
            trailing: Icon(Icons.cancel),
            onTap: ()=> Navigator.of(context).pop()
           
          )
          ],
        ),
      ),
      body: Center(
        child: Text("Homepage",style: TextStyle(fontSize: 35.0)),
      ),
    );;
  }
}