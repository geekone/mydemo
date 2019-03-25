import 'package:flutter/material.dart';
import 'package:mbb1/net/httputils.dart';
import 'package:mbb1/view/page/mv/fetchoptionpage.dart';


/**
 *  添加选项的页面
 */

class FetchoptionAddPage extends StatelessWidget {
  
  final TextEditingController _titleController = new TextEditingController();
  final TextEditingController _startpageController = new TextEditingController();
  final TextEditingController _srcController = new TextEditingController();
  final TextEditingController _endpageController = new TextEditingController();

  void _create(title,startpage,src,endpage) async{
    final _data = {
      'title':title,
      'startpage':startpage,
      'src':src,
      'endpage':endpage,
    };
    final result = await HttpUtils.request("/fetchoptions",method:HttpUtils.POST,data: _data);
    print(result);      //非同步的
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            title: Text('添加Fetchoption'),
          ),
          body: Container(
            padding: EdgeInsets.all(32.0),
            child: Center(
              child: Column(
                children: <Widget>[
                  TextField(
                    controller: _titleController,
                    decoration: InputDecoration(
                      hintText: 'title'
                    ),
                  ),
                  TextField(
                    controller: _startpageController,
                    decoration: InputDecoration(
                      hintText: 'startpage'
                    ),
                  ),
                  TextField(
                    controller: _srcController,
                    decoration: InputDecoration(
                      hintText: 'src'
                    ),
                  ),
                  TextField(
                    controller: _endpageController,
                    decoration: InputDecoration(
                      hintText: 'endpage'
                    ),
                  ),
                  RaisedButton(
                    child: Text("保存"),
                    onPressed: (){


                      final title = _titleController.text;
                      final fetchurl =_startpageController.text;
                      final src =_srcController.text;
                      final endpage =_endpageController.text;
                      _create(title,fetchurl,src,endpage);     

                       Navigator.push(context, MaterialPageRoute(builder: (context){ return FetchoptionPage();}));
                    },
                  ),
                ],
              ),
            ),
          ),
        );
    
  }
}