import "dart:async";
import "package:sqflite/sqflite.dart";
import "package:path/path.dart";
import "package:app1/models/artitle.dart";

class ArticleDbHelper{

  static final ArticleDbHelper _instance = new ArticleDbHelper.internal();
 
  factory ArticleDbHelper() => _instance;
 
  final String tableArticle = 'articles';
  final String columnId = 'id';
  final String columnTitle = 'title';
  final String columnSummary = 'summary';
 
  static Database _db;
 
  ArticleDbHelper.internal();
 
  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();
 
    return _db;
  }
 
  initDb() async {
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'app1.db');
 
//    await deleteDatabase(path); // just for testing
 
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }
 
  void _onCreate(Database db, int newVersion) async {
    await db.execute(
        'CREATE TABLE $tableArticle($columnId INTEGER PRIMARY KEY, $columnTitle TEXT, $columnSummary TEXT)');
  }

  Future<int> saveArticle(Article article) async{
    var dbClient = await db;
    var result = await dbClient.insert(tableArticle, article.toMap());
    //    var result = await dbClient.rawInsert(
//        'INSERT INTO $tableNote ($columnTitle, $columnDescription) VALUES (\'${note.title}\', \'${note.description}\')');
 
    return result;
  }

  Future<int> getCount() async {
    var dbClient = await db;
    return Sqflite.firstIntValue(await dbClient.rawQuery('SELECT COUNT(*) FROM $tableArticle'));
  }

  Future<List> getAllNotes() async {
    var dbClient = await db;
    var result = await dbClient.query(tableArticle, columns: [columnId, columnTitle, columnSummary]);
//    var result = await dbClient.rawQuery('SELECT * FROM $tableNote');
 
    return result.toList();
  }
  
  Future<Article> getArticle(int id) async{
    var dbClient = await db;
    List<Map> result = await dbClient.query(tableArticle,columns: [columnId,columnTitle,columnSummary],where: '$columnId=?',whereArgs: [id]);
    //    var result = await dbClient.rawQuery('SELECT * FROM $tableNote WHERE $columnId = $id');
    if(result.length > 0){
      return new Article.fromMap(result.first);
    }
    return null;
  }

  Future<int> deleteArticle(int id) async {
    var dbClient = await db;
    return await dbClient.delete(tableArticle,where:"$columnId=?",whereArgs: [id]);
    // return await dbClient.rawDelete('DELETE FROM $tableNote WHERE $columnId = $id');
  }

  Future<int> updateArticle(Article article) async{
    var dbClient = await db;
    //    return await dbClient.rawUpdate(
//        'UPDATE $tableNote SET $columnTitle = \'${note.title}\', $columnDescription = \'${note.description}\
    return await dbClient.update(tableArticle, article.toMap(),where:'$columnId=?',whereArgs: [article.id]);
  }

  Future close() async{
    var dbClient = await db;
    return dbClient.close();
  }

}