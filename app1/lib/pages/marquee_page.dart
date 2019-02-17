import "package:flutter/material.dart";
import "package:app1/components/marquee_components.dart";

/**
 *  用于测试跑马灯的组件,这里只用了连惯性的组件  //https://juejin.im/post/5c55b36051882562811d2ddd
 */
class MarqueePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("测试marquee的组件"),),
      body:new Center(
            child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  //TODO 这里注意了一个要放个Container，并且把组件放里面，才能放二个以前的
                Container(
                    height: 40.0,
                    color: Colors.green,
                    child: MarqueeContinuous(
                        child: Container(
                      padding: EdgeInsets.all(8.0),
                      // add padding to separate
                      child: Text('this is a short but continous shown text.'),
                    ))
                ),
                  Container(
                    height: 40.0,
                  // ListView nest in Column will throw a exception:
                  // Horizontal viewport was given unbounded height.
                  // to avoid this you can use a Container with height to wrap the marquee widget
                  child: MarqueeContinuous(
                    
                      child: Container(
                    padding: EdgeInsets.all(8.0),
                    // add padding to separate
                    child: Text('this is a short but continous shown text.'),
                  ))),
                ]
            )
        )
    );
  }
}