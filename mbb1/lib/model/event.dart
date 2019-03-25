
class Event {
  final int id;
  final String title;
  final String createdat;

  //构造函数
  Event({this.id,this.title,this.createdat});      

  //从json转
  factory Event.fromJson(Map<String,dynamic> json){
    return Event(
      id:json['id'] as int,
      title: json['title'] as String,
      createdat: json['created_at'] as String,
    );
  }


}