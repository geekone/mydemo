import 'package:flutter/material.dart';
import 'package:app2/network/request.dart';
import 'package:app2/model/recommend.dart';

class MyHomeListView extends StatefulWidget {
  _MyHomeListViewState createState() => _MyHomeListViewState();
}

class _MyHomeListViewState extends State<MyHomeListView> {
  List<Recommend> modules = [];

  Future<void> fetchData() async{
    List<Recommend> modules = [];
    var responseJson = await Request.get(action: "myhome_recommend");
    responseJson.forEach( (data){
      modules.add(Recommend.fromJson(data));
    });

    setState(() {
      this.modules = modules;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  Widget buildModule(BuildContext context,Recommend module){
    return ListTile(
      title: Text(module.id),
    );
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: fetchData,
      child: ListView.builder(
        itemCount: modules.length,
        itemBuilder: (BuildContext context,int index){
          return buildModule(context, modules[index]);
        },
      ),
    );
  }
}