/**
 * 抓取的电影
 */


class FetchMovie{
  int id;
  String title;
  String fetchurl;
  String img;
  String createdat;

  FetchMovie({this.id,this.title,this.fetchurl,this.img,this.createdat});


  factory FetchMovie.fromJson(Map<String,dynamic> json){
    return FetchMovie(
      id:json['id'] as int,
      title:json['title'] as String,
      fetchurl: json['fetchurl'] as String,
      img: json['img'] as String,
      createdat: json['created_at'] as String,
    );
  }


}