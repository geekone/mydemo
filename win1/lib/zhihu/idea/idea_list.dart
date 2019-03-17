import 'package:flutter/material.dart';
import 'package:win1/zhihu/model/idea.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:win1/zhihu/utils/screen.dart';

class IdeaList extends StatelessWidget{

  final List<Idea> ideas;

  const IdeaList({Key key,this.ideas}):super(key:key);

  
  @override
  Widget build(BuildContext context) {
    var children = ideas
        .map((item){
         return IdeaListItem(item: item);
        })
        .toList();

    return Column(
      children: children,
    );
  }
}

class IdeaListItem extends StatelessWidget {
  final Idea item;

  const IdeaListItem({Key key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: Colors.white,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(//头象部分
              padding: const EdgeInsets.only(top: 8.0),
              child: CircleAvatar(        
                radius: 20.0,
                backgroundImage: CachedNetworkImageProvider(item.author.avatar_url)       
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,   //上到下
                children: <Widget>[
                  Text(
                      item.author.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                  ),
                  Text(
                      "12天前",
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                  ),
                  Container(
                    width: Screen.width(context) * 0.8,       //*用来适应屏宽的把文章的内容
                    child: Text(
                      item.content,
                      maxLines: 3,                            //*换行了
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                  Image(
                    image: CachedNetworkImageProvider(item.imageurl),
                    width: 200.0,
                    height: 112.0,
                  ),
                ],
              ),
            )
          ],
        )
      ),
    );
  }
}