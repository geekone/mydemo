import 'package:flutter/material.dart';

import 'package:mbb1/view/widget/moviedrawer.dart';
import 'package:mbb1/view/page/mv/eventlistpage.dart';
import 'package:mbb1/view/page/mv/fetchoptionpage.dart';
import 'package:mbb1/view/page/mv/fetchmovielistpage.dart';
/**
 * MainPage BottomTab 里面的首页
 */
class MoviePage extends StatefulWidget {
  _MoviePageState createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> with SingleTickerProviderStateMixin{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("k8node的项目"),
        actions: <Widget>[
          IconButton(
            icon:Icon(Icons.add),
            tooltip: "add",
            onPressed: (){

            },
          )
        ],
        
      ),
      drawer: MovieDrawer(),           //首页放一个独立出来的StatelessWidget,里面是 返回的 container 包住的 drawer
      body: Container(
        padding: const EdgeInsets.only(top: 10.0),
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,     //* 这表示ROW里面的平均分配
          children: <Widget>[
            RaisedButton(
              child: Text("events"),
              onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context){ return EventListPage();}));
              },
            ),
            RaisedButton(
              child: Text("fetchoption"),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){ return FetchoptionPage();}));
              },
            ),
            RaisedButton(
              child: Text("fetchmovie"),
              onPressed: (){
                 Navigator.push(context, MaterialPageRoute(builder: (context){ return FetchMovieListPage();}));
              },
            ),
          ],
        ),
      )
    );
  }
}