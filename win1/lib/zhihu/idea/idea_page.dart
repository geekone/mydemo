import 'package:flutter/material.dart';
import 'package:win1/zhihu/utils/request.dart';
import 'package:win1/zhihu/model/idea.dart';
import 'package:win1/zhihu/idea/idea_list.dart';

class IdeaPage extends StatefulWidget {

  @override
  _IdeaState createState() => _IdeaState();
}

class _IdeaState extends State<IdeaPage> {

  List<Idea> ideas = [];    //装入idea对象的列表

   @override
   void initState() { 
     super.initState();
    fetchData();   
   }

  Future<void> fetchData() async{
    var responseJson = await Request.get(action:'idea_topic');
    List ideaJson =responseJson['idea'];      //data->idea节点 是一个 array list json
    
    List<Idea> ideas = [];      //转换到私有变量再给setState里的 ideas用
    ideaJson.forEach( (data) {
      ideas.add(Idea.fromJson(data));   
    });

    setState(() {
     this.ideas =ideas; 
    });

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          ListView(
            children: <Widget>[
              IdeaList(ideas: ideas)
            ],
          )
        ],
      )
    );
  }
}