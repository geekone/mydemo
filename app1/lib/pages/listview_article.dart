import "package:flutter/material.dart";
import "package:app1/models/artitle.dart";
import "package:app1/utils/articledbhelper.dart";
import "package:common_utils/common_utils.dart";
import "package:app1/pages/article_screen.dart";

class ListViewArticle extends StatefulWidget {
  _ListViewArticleState createState() => _ListViewArticleState();
}

class _ListViewArticleState extends State<ListViewArticle> {
  List<Article> items = new List();
  ArticleDbHelper db;

  _initData(){
    Article a1 = new Article("title1", "summary1");
    Article a2 = new Article("title2", "summary2");
    Article a3 = new Article("title3", "summary3");
   
    db.saveArticle(a1);
    db.saveArticle(a2);
    db.saveArticle(a3);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    db = new ArticleDbHelper();
    db.getAllNotes().then((articles) {
      setState(() {
        articles.forEach((article) {
          items.add(Article.fromMap(article));      //这句重要
        });
      });
    });
    // db.getCount().then( (data){
    //   LogUtil.e(data,tag:"app1");
    // });

  }

  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListView Article Demo"),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: ListView.builder(
          itemCount: items.length,
          padding: const EdgeInsets.all(15.0),
          itemBuilder: (context,position){
            return Column(
              children: <Widget>[
                  Divider(height: 5.0),
                ListTile(
                  title: Text('${items[position].title}',style: TextStyle(fontSize: 22.0,color: Colors.deepOrangeAccent)),
                  subtitle: Text('${items[position].summary}',style: TextStyle(fontSize: 18.0,color: Colors.grey,fontStyle: FontStyle.italic)),
                  leading: Column(
                    children: <Widget>[
                      Padding(padding: EdgeInsets.all(10.0)),
                      CircleAvatar(
                        backgroundColor: Colors.blueAccent,
                        radius: 15.0,
                        child: Text('${items[position].id}',style: TextStyle(fontSize: 22.0,color: Colors.white)),
                      ),
                      IconButton(
                              icon: const Icon(Icons.remove_circle_outline),
                              onPressed:()=>_deleteArticle(context,items[position],position),
                      )
                    ],
                  ),
                  onTap:  () => _navigateToArticle(context, items[position]),
                ),
                
              ],
            );
          },
        )
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: ()=> _createNewArticle(context),
      ),
    );
  }

  //TODO 这个很酷。传进来了一个article对象，取的ID用于删除 ，并且给了一个INDEX，用于state清理ITEMS
  void _deleteArticle(BuildContext context,Article article,int position) async{
    db.deleteArticle(article.id).then( (_){
      setState(() {
        items.removeAt(position);
      });
    });

  }

  //用于修改
  void _navigateToArticle(BuildContext context,Article article) async{
    String result = await Navigator.push(
      context,MaterialPageRoute(builder: (context)=>ArticleScreen(article)),
    );
    if (result =='update'){
      db.getAllNotes().then( (articles){
        setState(() {
         items.clear();
         articles.forEach( (article){
           items.add(Article.fromMap(article));
         }); 
        });
      });
    }
  }

  //TODO 返回数据要加上async
  void _createNewArticle(BuildContext context) async {
    String result =  await Navigator.push(context, MaterialPageRoute(builder: (context) => ArticleScreen(Article("", ""))));    //从下一个窗口返回了save
    if(result == 'save'){
      //返回了数据刷新state
      db.getAllNotes().then( (articles) {
        setState(() {
          items.clear();
          articles.forEach((article){
            items.add(Article.fromMap(article));
          });
        });
      });
    }
  }

}