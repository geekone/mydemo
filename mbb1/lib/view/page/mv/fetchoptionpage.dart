import 'package:flutter/material.dart';
import 'package:mbb1/model/fetchoption.dart';
import 'package:mbb1/net/httputils.dart';
import 'package:mbb1/view/page/mv/fetchoptionaddpage.dart';



class FetchoptionPage extends StatefulWidget {

  FetchoptionPage({Key key}) : super(key: key);

  @override
  _FetchoptionPageState createState() => _FetchoptionPageState();
}

class _FetchoptionPageState extends State<FetchoptionPage> {
  List<Fetchoption> items = new List();

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _loadData() {
    HttpUtils.request("/fetchoptions",method:HttpUtils.GET).then( (result){
      List temp = result['data'];     //取得data的临时的json
      setState(() {
        temp.forEach( (jsondata){
          items.add(Fetchoption.fromJson(jsondata));
        });
      });
    });
    
  }


  void _delete(id) async{
     await HttpUtils.request("/fetchoptions/:id",method:HttpUtils.DELETE,data:{"id":id});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            title: Text('FetchOptions'),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.add),
                tooltip: '添加',
                onPressed: (){
                  Navigator.of(context).pop();
                  Navigator.push(context, MaterialPageRoute(builder: (context){ return FetchoptionAddPage();}));
                },
              ),
            ],
          ),
          body: Container(
            padding: EdgeInsets.all(32.0),
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context,position){

               final it = items[position].title;


                return Dismissible(
                  key: new Key(it),
                  onDismissed: (direction){
                    int id = items[position].id;
                    items.removeAt(position);
                    _delete(id);
                    // setState(() {
                    //   items.removeAt(position);
                    // });

                    Scaffold.of(context).showSnackBar( new SnackBar(content: new Text("$id dismissed")));
                  },
                  direction: DismissDirection.endToStart,     //* 一个方向。右到左
                    background: Container(
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.only(right: 16.0),
                      color: Colors.red,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Text('DEL',
                              style: TextStyle(color: Colors.white)),
                          Icon(
                            Icons.delete,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),


                  child: ListTile(
                    leading: Icon(Icons.star),
                    title: Text( '${items[position].title}'),
                    subtitle: Text('${items[position].startpage}'),
                    onTap: (){
                      print( items[position].id);
                    }
                  ),
                );


                // return ListTile(
                //   title: Text( '${items[position].title}'),
                //   onTap: (){
                //     print( items[position].id);
                //   },
                // );
              }
            )
          ),
        );
    
  }
}