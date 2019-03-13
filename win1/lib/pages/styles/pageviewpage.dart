import 'package:flutter/material.dart';


/**
 * pageview的基本使用 https://www.jianshu.com/p/86878eb9247f
 */


class PageViewPage extends StatefulWidget {
  final String title;

  PageViewPage({Key key, this.title}) : super(key: key);

  _PageViewPageState createState() => _PageViewPageState();
}

class _PageViewPageState extends State<PageViewPage> {

  // 复杂使用 PageView，加上PageController 如何控制侦听 
  var imgUrlList = [
    'https://ws1.sinaimg.cn/large/0065oQSqgy1fwgzx8n1syj30sg15h7ew.jpg',
    'https://ws1.sinaimg.cn/large/0065oQSqly1fw8wzdua6rj30sg0yc7gp.jpg',
    'https://ws1.sinaimg.cn/large/0065oQSqly1fw0vdlg6xcj30j60mzdk7.jpg',
    'https://ws1.sinaimg.cn/large/0065oQSqly1fuo54a6p0uj30sg0zdqnf.jpg'
  ];

  PageController controller = new PageController();
  var pageOffset = 0.0;
  @override
  void initState() {
    controller.addListener( (){
      // print(controller.offset);     //*可以得到ViewPage里面的偏移量
       setState(() {
        pageOffset = controller.offset / 200;
      });
    });
    super.initState();
  }


   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text(widget.title)),
      body:Center(
        child: Container(
          child: PageView(
            controller: controller,
            children: imgUrlList.map( (item) => buildPageItem(imgUrlList.indexOf(item), item)).toList(),      //* 这段很COOL，如何从list.map出一个新widget，并且如何取index的
          ),
          width: 200.0,     
          height: 200.0,
        )
      )
    );
  }

  //要用的是Transform的translate和scale方法，也就是偏移和缩放效果
  Widget buildPageItem(int index,String imgUrl){
    // return Image.network(imgUrl);

     var currentLeftPageIndex = pageOffset.floor();
    var currentPageOffsetPercent = pageOffset - currentLeftPageIndex;
    return Transform.translate(
      offset: Offset((pageOffset - index) * 200, 0),
      child: Transform.scale(
        scale: currentLeftPageIndex == index
            ? 1 - currentPageOffsetPercent
            : currentPageOffsetPercent,
        child: Image.network(imgUrl),
      ),
    );
  }


  // 最简单的和使用 PageView 加载 图片，并且 可以左右划动
  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(title:Text(widget.title)),
  //     body:Center(
  //       child: Container(
  //         child: PageView(
  //           children: <Widget>[
  //             Image.network('https://ws1.sinaimg.cn/large/0065oQSqgy1fwgzx8n1syj30sg15h7ew.jpg'),
  //             Image.network('https://ws1.sinaimg.cn/large/0065oQSqly1fw8wzdua6rj30sg0yc7gp.jpg'),
  //             Image.network('https://ws1.sinaimg.cn/large/0065oQSqly1fw0vdlg6xcj30j60mzdk7.jpg'),
  //             Image.network('https://ws1.sinaimg.cn/large/0065oQSqly1fuo54a6p0uj30sg0zdqnf.jpg'),
  //           ],
  //         ),
  //         width: 200.0,     //*给container 加上宽高，就会把PageView 和 图片控制大小了
  //         height: 200.0,
  //       ),
  //     )
  //   );
  // }
}