import 'package:flutter/material.dart';
import 'package:app1/models/artitle.dart';
import "package:app1/utils/articledbhelper.dart";

class ArticleScreen extends StatefulWidget{
  final Article article;
  ArticleScreen(this.article);

  @override
  State<StatefulWidget> createState()=> new _ArticleScreenState();
}

class _ArticleScreenState extends State<ArticleScreen>{

    ArticleDbHelper db = new ArticleDbHelper();


    TextEditingController _titleEditingController;
    TextEditingController _summaryEditingController;

    @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _titleEditingController = new TextEditingController(text: widget.article.title);
    _summaryEditingController = new TextEditingController(text: widget.article.summary);
  }


    @override
    Widget build(BuildContext context){
        return Scaffold(
          appBar: AppBar(title:Text("Create Article")),
          body: Container(
            margin: const EdgeInsets.all(15.0),
            alignment: Alignment.center,
            child: Column(
              children: <Widget>[
                TextField(
                  controller: _titleEditingController,
                  decoration: InputDecoration(labelText: 'Title'),
                ),
                Padding(padding: new EdgeInsets.all(5.0)),
                TextField(
                  controller: _summaryEditingController,
                  decoration: InputDecoration(labelText: 'Summary'),
                ),
                Padding(padding: new EdgeInsets.all(5.0)),
                RaisedButton(
                  child: (widget.article.id != null) ? Text("Update"):Text("Add"),
                  onPressed: (){
                    if (widget.article.id !=null){
                      //修改
                      db.updateArticle(Article.fromMap({
                        'id':widget.article.id,
                        'title':_titleEditingController.text,
                        'summary':_summaryEditingController.text,
                      })).then((_){
                        Navigator.pop(context,"update");
                      });
                    }else{
                        db.saveArticle(Article(_titleEditingController.text,_summaryEditingController.text)).then( (_){
                        Navigator.pop(context,"save");      //给关闭的窗口返回一个数据
                      });
                    }
                  
                  },
                )
              ],
            ),
          ),
        );
    }

}