import 'package:flutter/services.dart' show rootBundle;         //只引用一个类rootBundle

import "dart:convert";          //这里因为用到了 json.decode方法把 str数据转成 json
class Request{

  //静态方法通过 action 取得 mock目录下的数据,访 dio
  static Future<dynamic> get({String action,Map params}) async{
    return Request.mock(action:action,params: params);
  }

  //调用mock目录下的临时数据
  static Future<dynamic> mock({String action,Map params}) async{
    var responseStr = await rootBundle.loadString("mock/$action.json");
    var responseJson = json.decode(responseStr);
    return responseJson['data']; 
  }

}