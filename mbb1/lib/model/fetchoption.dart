/**
 * 用于控制抓取选项的类模型 
 */


class Fetchoption{
  int id;
  String title;
  int startpage;
  int endpage;

  Fetchoption({this.id,this.title,this.startpage,this.endpage});


  factory Fetchoption.fromJson(Map<String,dynamic> json){
    return Fetchoption(
      id:json['id'] as int,
      title:json['title'] as String,
      startpage: json['startpage'] as int,
      endpage: json['endpage'] as int,
    );
  }


}