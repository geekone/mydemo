// Id: 1,
// Lid: 4,
// Tr: "英超",
// Cn: "英超",
// En: "EPL",
// Color: "#990000",
// Type: 1,
// Ismain: 1,
// Country: 125,
// Area: 3


class League{
  final int id;
  final int lid;
  final String tr;
  final String cn;
  final String en;
  final String color;
  final int type;
  final int ismain;
  final int country;
  final int area;

  League({this.id,this.lid,this.tr,this.cn,this.en,this.color,this.type,this.ismain,this.country,this.area});

  factory League.formJson(Map<String,dynamic> json){
    return League(
      id:json['Id'] as int,
      lid:json['Lid'] as int,
      tr:json['Tr'] as String,
      cn:json['Cn'] as String,
      en:json['En'] as String,
      color:json['Color'] as String,
      type:json['Type'] as int,
      ismain: json['Ismain'] as int,
      country: json['Country'] as int,
      area: json['Area'] as int,
    );
  }


}