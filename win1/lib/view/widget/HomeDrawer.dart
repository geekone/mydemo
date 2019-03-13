import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


/**
 *  作为一个首页的 Drawer组件的 独立出来
 */


class HomeDrawer extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    //TODO store 
    return Container(
      width: 240,       //* 这个是为了限制住Drawer的宽度，用一个Container包起来
      child: Drawer(
        child: ListView (
          
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.work),title:Text('项目主页')
            ),
            ListTile(
              leading: Icon(Icons.swap_vertical_circle),title: Text('清除缓存'),
              onTap: (){
                //TODO DB clean
                Fluttertoast.showToast(
                  msg:'清除成功',
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIos: 1,
                  backgroundColor: Colors.black,
                  textColor: Colors.white,
                  fontSize: 16.0
                );
              },
            )
          ]
        
        )
          
        ),
      );
  }
}