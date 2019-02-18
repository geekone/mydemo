// Id: 1,
// Tid: 88080,
// Tr: "亞松森河床",
// Cn: "亚松森河床",
// En: "River Plate CA",
// Pos: 6,
// Country: ""

class Team{
  final int id;
  final int tid;
  final String tr;
  final String cn;
  final String en;
  final int pos;
  final String country;

  Team({this.id,this.tid,this.tr,this.cn,this.en,this.pos,this.country});

  factory Team.fromJson(Map<String,dynamic> json){
    return Team(
      id:json['Id'] as int,
      tid:json['Tid'] as int,
      tr:json['Tr'] as String,
      cn:json['Cn'] as String,
      en:json['En'] as String,
      pos:json['Pos'] as int,
      country: json['Country'] as String,
    );
  }


}