import 'package:flutter/material.dart';


/**
 * pageview的第二个例子 https://www.jianshu.com/p/5b594edaef26
 */


class PageViewPage2 extends StatefulWidget {
  final String title;

  PageViewPage2({Key key, this.title}) : super(key: key);

  _PageViewPageState2 createState() => _PageViewPageState2();
}

class _PageViewPageState2 extends State<PageViewPage2> {

 
  // 复杂使用 PageView，加上PageController 如何控制侦听 
  var imgUrlList = [
    'https://ws1.sinaimg.cn/large/0065oQSqgy1fwgzx8n1syj30sg15h7ew.jpg',
    'https://ws1.sinaimg.cn/large/0065oQSqly1fw8wzdua6rj30sg0yc7gp.jpg',
    'https://ws1.sinaimg.cn/large/0065oQSqly1fw0vdlg6xcj30j60mzdk7.jpg',
    'https://ws1.sinaimg.cn/large/0065oQSqly1fuo54a6p0uj30sg0zdqnf.jpg'
  ];

   @override
  Widget build(BuildContext context) {



      // 第二种 FloatingActionButton 启动 SnackBar
     GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey();

    return Scaffold(
      key: _scaffoldkey,    // 第二种 FloatingActionButton 启动 SnackBar
      appBar: AppBar(title:Text(widget.title)),

      // 第二种 FloatingActionButton 启动 SnackBar
      floatingActionButton: FloatingActionButton(
           tooltip: 'Switch Gradient Effect',
          child: Icon(Icons.all_inclusive),
        onPressed: (){
          _scaffoldkey.currentState.showSnackBar(
            SnackBar(
                backgroundColor: Colors.deepOrangeAccent,
                duration:Duration(milliseconds: 800),
                content: Text("SnackBar"))
          );
        },
      ),
      // 第一种 FloatingActionButton 启动 SnackBar 是写一个Builder
      // floatingActionButton: new Builder(builder: (BuildContext context) {
      //   return new FloatingActionButton(
      //      tooltip: 'Switch Gradient Effect',
      //     child: Icon(Icons.all_inclusive),
      //   onPressed: () {
      //     Scaffold
      //         .of(context)
      //         .showSnackBar(
      //           SnackBar(
      //           backgroundColor: Colors.deepOrangeAccent,
      //           duration:Duration(milliseconds: 800),
      //           content: Text("SnackBar"))
      //         );
      //   });
      // }),
      body:Center()
      
    );
  }


}