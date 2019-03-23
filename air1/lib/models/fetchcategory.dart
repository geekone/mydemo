
class Event{
    int id;
    String title;
  
    Event({this.id,this.title});
  
    factory Event.fromJson(Map<String, dynamic> json) {
      return Event(
        id: json['id'] as int,
        title: json['title'] as String,
  
      );
    }
}