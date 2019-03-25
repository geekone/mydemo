import 'package:flutter/material.dart';
import 'package:mbb1/model/event.dart';
import 'package:mbb1/net/httputils.dart';
import 'dart:io';
import 'package:dio/dio.dart';

class EventListPage extends StatefulWidget {

  EventListPage({Key key}) : super(key: key);

  _EventListPageState createState() => _EventListPageState();
}

class _EventListPageState extends State<EventListPage> {
  List<Event> items = new List();

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _loadData(){
    HttpUtils.request("/events",method:HttpUtils.GET).then( (result){
      List temp = result['data'];
      temp.forEach( (jsondata) {
        setState(() {
           items.add(Event.fromJson(jsondata));
        });
      });
    });
  }



   void _delete(id) async{
    final result = await HttpUtils.request('/events/:id',method: HttpUtils.DELETE, data: {"id":id});
    print(result);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            title: Text('Events 列表'),
          ),
          body: Container(
            

            padding: EdgeInsets.all(32.0),
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (BuildContext context, int index) {
                  final id = items[index].id.toString();
                  return Dismissible(
                    key:Key(id),
                    child: ListTile(
                      title: Text('${items[index].title} '),
                      leading: Icon(Icons.star),
                      subtitle: Text('${items[index].id} - ${items[index].createdat}'),
                    ),
                    background: Container(
                      color: Colors.red,
                    ),
                    onDismissed: (drection){
                      int id = items[index].id;
                      _delete(id);
                      items.removeAt(index);
                      
                      Scaffold.of(context).showSnackBar( new SnackBar(content: new Text("$id delete")));
                    },
                  );
                 
              }
            )

            )
         );
  }
  
}