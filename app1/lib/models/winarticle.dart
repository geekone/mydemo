
class WinArticle{
  int id;
  String title;
  String img;

  WinArticle({this.id,this.title,this.img});

  factory WinArticle.fromJson(Map<String, dynamic> json) {
    return WinArticle(
      id: json['Id'] as int,
      title: json['Title'] as String,
      img: json['Img'] as String,
    );
  }




}