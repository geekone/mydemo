import "dart:async";
import "dart:convert";
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

Future fetchArticles(Dio client) async{
  final response = await client.get("http://api.5sdj.com/v1/articles");
  return response.data['data'];
}



class WinArticles extends StatefulWidget {
   final String title;
  WinArticles({Key key,this.title}):super(key:key);

  

   @override
  _WinArticlesState createState() => _WinArticlesState();
}

class _WinArticlesState extends State<WinArticles> {
 
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchArticles(new Dio()).then( (resp) {
      print(resp);
    });
  }

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(title: Text(widget.title),),
      body:Center(
        child: Text("....."),
      )
    );
  }
}


