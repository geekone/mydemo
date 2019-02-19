import 'package:flutter/material.dart';
import 'package:app1/pages/win113/win_articles.dart';
import 'package:app1/pages/win113/win_articles_start.dart';
/**
 * win113的首页
 */

class WinHome extends StatelessWidget {


  Column buildButtonColumn(IconData icon,String label,BuildContext context,Widget widget){
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(icon,color:Colors.blue),
        Container(
          
          // margin: const EdgeInsets.only(top:2.0),
          child: FlatButton(
            child: Text(label,style: TextStyle(fontSize: 10.0),),
            color: Colors.blue,
            onPressed: (){
              // Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(builder: (context){ return widget;}));
            },
          )
        )

      ]
    );
  }

  Row buildButtonGroup(BuildContext context){
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
            buildButtonColumn(Icons.call, "没有抓取的文章",context,WinArticles(title: "没有抓取的文章" )),
            buildButtonColumn(Icons.call, "准备抓取的文章",context,WinArticlesStart()),
            buildButtonColumn(Icons.call, "label1",context,WinArticles()),
        
      ],
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("win113的所有页面"),),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            buildButtonGroup(context),
            buildButtonGroup(context),
        
          ],
        ),
      ),
    );
  }
}