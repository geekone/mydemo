import "package:flutter/material.dart";



//https://blog.csdn.net/hekaiyou/article/details/70265819
//Flutter进阶—构建布局实例
class Test2Page extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    //公共的上下的按键
    Column buildButtonColumn(IconData icon,String label){
      Color color = Theme.of(context).primaryColor;
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(icon,color:color),
          Container(
            margin: const EdgeInsets.only(top:8.0),
            child: Text(label,style: new TextStyle(fontSize: 12.0,fontWeight: FontWeight.w400,color:color)),
          )
        ],
      );
    }

    Widget buttonSection = new Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,//沿主轴对齐列，以便在每列之前，之间和之后均匀排列可用空间
        children: <Widget>[
          buildButtonColumn(Icons.call, '电话'),
          buildButtonColumn(Icons.near_me, '导航'),
          buildButtonColumn(Icons.call, '分享'),
        ],
      ),
    );


    //标题子组件
     Widget titleSection = Container(
      padding: const EdgeInsets.all(32.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text("红花山",style: TextStyle(fontWeight: FontWeight.bold),),
                ),
                Text('深圳市，光明新区，公明镇中心',style: TextStyle(color: Colors.grey))
              ]
            ),

          ),
          Icon(Icons.star,color: Colors.red,),
          Text('66')
        ],
      ),
    );

    Widget textSection = new Container(
        padding: const EdgeInsets.all(32.0),
        child: new Text(
          '''
            将文本部分定义为相当长的变量，将文本放在Container（容器）中，以便在每个边缘添加32个像素的填充。将文本部分定义为相当长的变量，将文本放在Container（容器）中，以便在每个边缘添加32个像素的填充。将文本部分定义为相当长的变量，将文本放在Container（容器）中，以便在每个边缘添加32个像素的填充。将文本部分定义为相当长的变量，将文本放在Container（容器）中，以便在每个边缘添加32个像素的填充。将文本部分定义为相当长的变量，将文本放在Container（容器）中，以便在每个边缘添加32个像素的填充。将文本部分定义为相当长的变量，将文本放在Container（容器）中，以便在每个边缘添加32个像素的填充。将文本部分定义为相当长的变量，将文本放在Container（容器）中，以便在每个边缘添加32个像素的填充。softWrap属性指示文本是否自动换行。红花山公园地处深圳市光明新区公明街道中心,位居松白公路的北端,红花山公园处处是精雕细刻的绿色，整洁、美丽的红花山公园就像一出浴的少女你无法拒绝她的温柔。登上仅百米的红花山极目远眺，楼群与树木花草相互掩映,经过修剪的树木造型别致分列公路两旁。2007年，光明新区公明街道投资30万元建设的红花山公园电子监控系统已完工，该公园各大出入口、环山路和主要休闲景点已设置25个电子监控探头，已经正式投入使用。辖区居民在此活动又多了道安全“保护网”。
          ''',
          softWrap: true, //softWrap属性指示文本是否自动换行。
        )
    );



    return Scaffold(
      body: ListView(
        children: <Widget>[
          new Image.asset('images/test2.jpg',height: 240.0,fit: BoxFit.cover,),
          titleSection,
          buttonSection,
          textSection
        ],
        
      ),
    );


    
   

  }

}