import 'package:flutter/material.dart';
import 'package:air1/models/event.dart';
import 'package:air1/net/httputils.dart';

class EventPage extends StatefulWidget {


  @override
  _EventPageState createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
    List<Event> items = new List();
  @override
  void initState() {
    super.initState();
    HttpUtils.request("/events",method: HttpUtils.GET).then((result){
       List temp = result['data'];
       setState(() {
         temp.forEach((eventjson){
           items.add(Event.fromJson(eventjson));
          });
       });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            title: Text('Events List'),
          ),
          body: Container(
            padding: EdgeInsets.all(32.0),
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, position) {
                return ListTile(
                  title: Text('${items[position].title}'),
                  leading: Icon(Icons.title),
                  onTap: (){
                    print(items[position].id);
                  },
                );
              },
            ),
          ),
        );
    
  }
}