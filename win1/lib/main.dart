import 'package:flutter/material.dart';



/*********  这个项目 参考的是 拓意阅读 **********/
// import 'package:win1/view/page/MainPage.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {

//   //TODO store

//   @override
//   Widget build(BuildContext context) {
//     //TODO store
//     return MaterialApp(
//       title: 'Win7',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: MainPage(),
//     );
//   }
// }


/*********  这个项目 参考的是 flutter_zhihu **********/

import 'package:win1/zhihu/home/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ZhiHu',
      theme: ThemeData(
        primaryColor: Colors.white,
//        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}