
import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;         //* 只取一个文件中的一个方法

class Request {
  static const String baseUrl = 'http://www.shuqi.com/';

  static Future<dynamic> get({String action,Map params}) async{
    return Request.mock(action: action,params: params);       //从mock里面取数据
  }


  /**
   * 读取mock的json数据
   * String action  表示文件名的前缀
   */
  static Future<dynamic> mock({String action,Map params}) async{
    var responseStr = await rootBundle.loadString('mock/$action.json');     //* 使用 rootBundle方法加载mock的json文件
    var responseJson = json.decode(responseStr);          //把str转成json
    return responseJson['data'];        //返回json 里面的 data节点
  }


  //TODO POST
}