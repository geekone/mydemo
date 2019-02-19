import "dart:async";
import "dart:convert";
import "package:flutter/material.dart";
import 'package:flutter/foundation.dart';         //这里因为用了compute，作为后台运行的调用的方法

import "package:app1/models/post.dart";
import 'package:dio/dio.dart';

Future<List<Post>> fetchPosts(Dio client) async{
  final response = await  client.get('https://jsonplaceholder.typicode.com/posts');
  return compute(parsePost,response.data);
 
  // return parsePost(response.data);
}

List<Post> parsePost(dynamic responseBody){
  // final parsed = json.decode(responseBody);
  // return parsed.map<Post>( (json) => Post.fromJson(json)).toList();
  return responseBody.map<Post>( (model){
    return new Post.fromJson(model);
  }).toList();
}



class DioPage extends StatelessWidget {
  Dio dio = new Dio();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("用于测试Http和加载"),),
      body: FutureBuilder<List<Post>>(
        future: fetchPosts(dio),
        builder: (context,snapshot){
          if(snapshot.hasError) print(snapshot.error);
          return snapshot.hasData ? ListViewPosts1(posts: snapshot.data,) : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class ListViewPosts1 extends StatelessWidget{
  final List<Post> posts;
  ListViewPosts1({Key key,this.posts}):super(key:key);

  @override
  Widget build(BuildContext context){
    return Container(
      child: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context,position){
          return Column(
            children: <Widget>[
              Divider(height: 5.0),
                ListTile(
                  title: Text(
                    '${posts[position].title}',
                    style: TextStyle(
                      fontSize: 22.0,
                      color: Colors.deepOrangeAccent,
                    ),
                  ),
                  subtitle: Text(
                    '${posts[position].body}',
                    style: new TextStyle(
                      fontSize: 18.0,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  leading: Column(
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.blueAccent,
                        radius: 35.0,
                        child: Text(
                          'User ${posts[position].id}',
                          style: TextStyle(
                            fontSize: 22.0,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                  onTap: () => _onTapItem(context, posts[position]),
                ),
            ],
          );
        },
      ),
    );
  }

  void _onTapItem(BuildContext context, Post post) {
    Scaffold
        .of(context)
        .showSnackBar(new SnackBar(content: new Text(post.id.toString() + ' - ' + post.title)));
  }

}