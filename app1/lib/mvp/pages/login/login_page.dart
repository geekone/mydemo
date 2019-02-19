import 'package:flutter/material.dart';
import 'package:app1/mvp/pages/login/login_page_contract.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';                        //jion方法用到
import 'package:common_utils/common_utils.dart';        //LogUtil.e()等工具类
import 'package:app1/models/user.dart';
import 'package:app1/utils/database_helpter.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> implements  LoginPageContract{

  DatabaseHelper db;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _initdb();          //初始数据库
    db = new DatabaseHelper();
  }

  void _initdb() async{
    // var databasesPath = await getDatabasesPath();
    // String path = join(databasesPath, 'app1.db');
    // // await deleteDatabase(path);        //删除数据库
    // //建立数据库和表的方式是内部一个async
    // Database database = await openDatabase(path,version:1,      
    // onCreate: (Database db,int version) async {
    //   await db.execute("CREATE TABLE Test (id INTEGER PRIMARY KEY,name TEXT,value INTEGER,num REAL)");
    //   await db.execute("CREATE TABLE User(id INTEGER PRIMARY KEY, username TEXT, password TEXT)");
    //   LogUtil.e("create tables  ok",tag:"app1");
    // });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    db.close();
    LogUtil.e("close database",tag: "app1");
    super.dispose();
  }


  void _btn_click() async{
    var user1 = new User("user1","pass1");
    var user2 = new User("user2","pass2");
    // LogUtil.e(user.username);
    // LogUtil.e(user.password);
    // LogUtil.e(user.toMap());
    // var db = new DatabaseHelper();
    var result = await db.saveUser(user1);
    LogUtil.e(result,tag: "app1");
    result = await db.saveUser(user2);
    LogUtil.e(result,tag:"app1");
    // await db.close();        //暂时不能关闭。是不是要放到
    
    // await db.saveUser(user2);
    
  }

  void _btn_delclick() async{
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'app1.db');
    await deleteDatabase(path);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login Page"),),
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              Text("Login Page"),
              RaisedButton(
                child: Text("点击"),
                onPressed: (){
                  _btn_click();
                },
              ),
              RaisedButton(
                child: Text("删除"),
                onPressed: _btn_delclick,  
              ),
              RaisedButton(
                child: Text("go home"),
                onPressed: (){
                  Navigator.of(context).pushNamed("/home");
                }  
              )
            ],
          )
        ),
      ),
    );
  }

  @override
  void onLoginSuccess(){

  }

  @override
  void onLoginError(){

  }

}