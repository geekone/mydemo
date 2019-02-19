
class Article{
  int _id;
  String _title;
  String _summary;

  Article(this._title,this._summary);

  Article.map(dynamic obj){
    this._id = obj['id'];
    this._title = obj['title'];
    this._summary = obj['summary'];
  }

  int get id => _id;
  String get title => _title;
  String get summary => _summary;

  //用于保存到数据库的
  Map<String,dynamic> toMap(){
    var map = new Map<String,dynamic>();
    if (_id != null){
      map['id'] = _id;
    }
    map['title'] = _title;
    map['summary'] = _summary;
    return map;
  }

  //这个是把 从数据库取出的map对象再转成当前数据对象
  Article.fromMap(Map<String,dynamic> map){
    this._id = map['id'];
    this._title = map['title'];
    this._summary = map['summary'];
  }

}