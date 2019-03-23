import 'package:flutter/material.dart';
import 'package:air1/net/httputils.dart';
import 'package:dio/dio.dart';
import 'package:air1/pages/tvapi/eventpage.dart';

class DioPage extends StatefulWidget {
  final String title;

  DioPage({Key key, this.title}) : super(key: key);

  @override
  _DioPageState createState() => _DioPageState();
}

class _DioPageState extends State<DioPage> {

  @override
  void initState() { 
    super.initState();
    _loadData();
  }

  void _loadData() async{
    print("loadData");
    // var result = await HttpUtils.request("/events",method: HttpUtils.GET);
    // print(result['data']);
    
  //   Dio dio = Dio();
  // final response = await dio.get("http://43.226.146.152:7001/v1/events");
  // print(response.data);
  // print("ok");
  }

  void _events() async{
    var result = await HttpUtils.request("/events",method: HttpUtils.GET);
    print(result['data']);
  }

  void _page() async{
    var result = await HttpUtils.request("/events/page/:offset",method:HttpUtils.GET,data:{'offset': '1',});
    // var result = await HttpUtils.request("/events/page/1",method:HttpUtils.GET,);
    print(result);
  }

  void _show() async{
    var result = await HttpUtils.request("/events/:id",method:HttpUtils.GET,data:{'id': 19,});
    print(result);
  }

  void _delete() async{
    var result = await HttpUtils.request("/events/:id",method:HttpUtils.DELETE,data:{'id':19,});
    print(result);      //这里没有返回什么
  }

  void _create() async{
    var result = await HttpUtils.request("/events",method:HttpUtils.POST,data:{"title":"aaaaaaa",});
    print(result);
  }

  void _put() async {
    var result = await HttpUtils.request("/fetchcategories/:id",method:HttpUtils.PUT,data:{"id":3,"name":"bbbb",});
    print(result);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            title: Text(this.widget.title),
            centerTitle: true,
          ),
          body: Container(
            padding: EdgeInsets.all(32.0),
            child: Center(
              child: Column(
                children: <Widget>[
                  RaisedButton(
                    child: Text("events"),
                    onPressed: (){
                      _events();
                    },
                  ),
                  RaisedButton(
                    child: Text("page"),
                    onPressed: (){
                      _page();
                    },
                  ),
                  RaisedButton(
                    child: Text("show"),
                    onPressed: (){
                      _show();
                    },
                  ),
                  RaisedButton(
                    child: Text("delete"),
                    onPressed: (){
                      _delete();
                    },
                  ),
                   RaisedButton(
                    child: Text("create"),
                    onPressed: (){
                      _create();
                    },
                  ),
                  RaisedButton(
                    child: Text("put"),
                    onPressed: (){
                      _put();
                    },
                  ),
                    RaisedButton(
                    child: Text("EventPage"),
                    onPressed: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context){ return EventPage();}));
                    },
                  )
                ],
              ),
            ),
          ),
        );
    
  }
}