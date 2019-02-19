import 'package:flutter/material.dart';
import 'package:common_utils/common_utils.dart';




/******************* flutter redux */

import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

enum Actions {
  Increase,
}

int mainReducer(int state,dynamic action){
  if(Actions.Increase == action){
    return state + 1;
  }
}


void main() {
  Store<int> store = Store<int>(mainReducer,initialState: 0);
  runApp(MyApp(store: store));

}

class MyApp extends StatelessWidget {
  final Store<int> store;
  MyApp({this.store});        //添加一个参数 
  @override
  Widget build(BuildContext context) {
    return new StoreProvider(
      store: store,
      child: MaterialApp(
              title:'Flutter Redux',
              theme: ThemeData(
                primaryColor: Colors.blue
              ),
              home: new StoreConnector(builder: (BuildContext context,int counter){
                return new MyHomePage(title: "Redux");
              },converter: (Store<int> store){
                return store.state;
              }),
          )

      );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  MyHomePage({Key key,this.title}):super(key:key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter(){
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("chick add "),
            Text('$_counter',style:Theme.of(context).textTheme.display1,)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _incrementCounter,
      ),
    );
  }
}


/*****************  flutter demo */

// void main() => runApp(MyApp());

// class MyApp extends StatefulWidget{
//   @override
//   _MyAppState  createState()=>_MyAppState();
// }

// class _MyAppState extends State<MyApp>{
//   @override
//   Widget build(BuildContext context){
//     return MaterialApp(
//       title:'Flutter Demos',
//       theme: ThemeData(
//         primaryColor: Colors.blue,
//       ),
//       home:MyHomePage(),
//       //TODO locate
//     );
//   }
// }

// class MyHomePage  extends StatefulWidget {
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {

  

//   @override
//   Widget build(BuildContext context) {

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('HOme'),
//         centerTitle: true,
//       ),
//       body: Center(
//         child: FloatingActionButton(
//           child: Text('click'),
//           onPressed: (){
            
//           LogUtil.init(isDebug: true, tag: "test");
//           LogUtil.e("...log...", tag: "test");
//           LogUtil.v("...log...", tag: "test");
//           LogUtil.e("...log...", tag: "test1");
//           LogUtil.v(DateUtil.getNowDateStr(), tag: "test1");

         





//           },
//         )
//       ),
//     );
//   }
// }




//***********************  这段是访知呼的程序,主要是学习如何使用mock和 下边的TAB + 页面的TAB如何配置 */
// import 'package:app2/home/home_page.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget{
//   @override
//   Widget build(BuildContext context){
//     return MaterialApp(
//       title: 'ZhiHu',
//       theme: ThemeData(
//         primaryColor: Colors.white,
//       ),
//       home: HomePage(),
//     );
//   }
// }

