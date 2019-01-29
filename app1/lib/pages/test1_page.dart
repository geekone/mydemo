import "package:flutter/material.dart";


//参考 https://blog.csdn.net/qq_38927134/article/details/79787884
class Test1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            title: Text('测试Flex布局'),
          ),
          body: Center(
            // padding: EdgeInsets.all(32.0),
              child: new Container(
                height: 120.0,
                padding: EdgeInsets.only(left: 20.0,right: 20.0),       //最外层添加padding
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 1.0,color: Colors.blue)
                  )
                ),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 2, //这个item占据剩余空间的份数，因为总数为3，所以此处占据2/3
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,//子组件的在交叉轴的对齐方式为起点
                        mainAxisAlignment:MainAxisAlignment.spaceBetween ,//子组件在主轴的排列方式为两端对齐
                        children: <Widget>[
                         Container(
                           padding: EdgeInsets.only(top:15.0),//标题写一个top-padding
                           decoration: new BoxDecoration(
                              border:new Border.all(
                                  color:const Color(0xff6d999b),
                              )
                            ),
                           child: Text("为什么说Flutter是革命性的",style: TextStyle(fontSize: 18.0),),
                         ),
                         Container(
                           padding:const EdgeInsets.only(right:13.0,bottom:15.0),
                           decoration: BoxDecoration(
                             border: Border.all(color:const Color(0xff6d999b),)
                           ),
                           child: Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,//子组件在主轴的排列方式为两端对齐
                              children: <Widget>[
                                new Text(
                                  '央视网',
                                ), 
                                new Text(
                                  '2018-03-11',
                                ), 
                              ],

                           )
                         )
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1, //这个item占据剩余空间的份数，因为总数为3，所以此处占据1/3
                      child: new Image.asset("images/head.jpg",height: 110.0,fit:BoxFit.cover),
                      

                    )
                  ],
                ),
              ),
            ),
        
        );
    
  }
}