

class Recommend {
  String id;
  String type;
  int created_time;
  int updated_time;

  Recommend.fromJson(Map data){
    id = data['id'];
    type = data['type'];
    created_time = data['updated_time'];
    updated_time = data['updated_time'];
  }

}