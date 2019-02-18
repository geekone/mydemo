import "package:flutter/material.dart";
import "package:app1/models/league.dart";
import "package:http/http.dart" as http;
import "dart:async";
import "dart:convert";
import 'package:flutter/foundation.dart';
Future<List<League>> fetchLeagues(http.Client client) async{
  final response = await client.get("http://api.5sdj.com/v1/leagues");
  return compute(parseLeague,response.body);
}

List<League> parseLeague(String responseBody){
  final parsed = json.decode(responseBody);
  return  parsed['data'].map<League>( (json) => League.formJson(json)).toList();
}


class LeaguePage extends StatelessWidget{


  @override
  Widget build(BuildContext context){
    return FutureBuilder<List<League>>(
      future: fetchLeagues(http.Client()),
      builder: (context,snapshot){

        if(snapshot.hasError) print(snapshot.error);


        return snapshot.hasData? ListViewLeague(leagues: snapshot.data) : Center(child: CircularProgressIndicator());
      }
    );
    
  }
}

class ListViewLeague extends StatelessWidget{
  final List<League> leagues;
  ListViewLeague({Key key,this.leagues}):super(key:key);

  @override
  Widget build(BuildContext context){
    return Container(
      child: ListView.builder(
            itemCount: leagues.length,
            itemBuilder: (context,position){
              return Row(
                
                children: <Widget>[
                Divider(height: 5.0),
                new Expanded(
                  child: new Text('${leagues[position].id}'),
                ),
                new Expanded(
                  child: new Text('${leagues[position].lid}'),
                ),
                new Expanded(
                  child: new Text('${leagues[position].tr}'),
                ),
                new Expanded(
                  child: new Text('${leagues[position].cn}'),
                ),
                 new Expanded(
                  child: new Text('${leagues[position].en}'),
                ),
                ],
              );
            },
          ),
    );
  }
}