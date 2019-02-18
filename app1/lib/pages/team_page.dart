import "package:flutter/material.dart";
import "dart:async";
import "dart:convert";
import "package:flutter/foundation.dart";
import "package:app1/models/team.dart";
import "package:http/http.dart" as http;

Future<List<Team>> fetchTeams(http.Client client) async{
  final response = await client.get("http://api.5sdj.com/v1/teams");
  return compute( parseTeam, response.body);
}

List<Team> parseTeam(String responseBody){
  final parsed = json.decode(responseBody);
  return parsed['data'].map<Team>( (json) => Team.fromJson(json)).toList();
}


class TeamPage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return FutureBuilder<List<Team>>(
      future: fetchTeams(http.Client()),
      builder: (context,snapshot){
        if(snapshot.hasError) print(snapshot.error);
        return snapshot.hasData ? ListViewTeam(teams: snapshot.data) : Center(child: CircularProgressIndicator());
      },
    );
  }
}

class ListViewTeam extends StatelessWidget {
  final List<Team> teams;
  ListViewTeam({Key key,this.teams}):super(key:key);


  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: teams.length,
        itemBuilder: (context,position){
          return Row(children: <Widget>[
            Divider(indent: 5.0,),
            Expanded(child: Text('${teams[position].id}')),
            Expanded(child: Text('${teams[position].tid}')),
            Expanded(child: Text('${teams[position].tr}')),
            Expanded(child: Text('${teams[position].cn}')),
            Expanded(child: Text('${teams[position].en}')),
            Expanded(child: Text('${teams[position].pos}')),
            Expanded(child: Text('${teams[position].country}')),
            
          ]);
        },
      ),
    );
  }
}