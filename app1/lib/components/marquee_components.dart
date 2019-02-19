import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:async';        //timer组件用到






//连惯性的
class MarqueeContinuous extends StatefulWidget {
  final Widget child;       //接收一个组件的参数
  final Duration duration;  //移动的时间
  final double stepOffset;  //偏移量 

  //默认了移动的2秒钟，和移动值
  MarqueeContinuous({Key key,this.child,this.duration=const Duration(seconds: 2),this.stepOffset=50.0}):super(key:key);

  @override
  _MarqueeContinuousState createState() => _MarqueeContinuousState();
}

//思路是用ScrollController控制一个ListView，横着移动
class _MarqueeContinuousState extends State<MarqueeContinuous> {
  ScrollController _controller;
  Timer _timer;
  double _offset =0.0;      //这是scrollController最开始的初始值为0


  void initState() { 
    super.initState();
    _controller =ScrollController(initialScrollOffset: _offset);    //初始scoll组件
    
    //定时器开始滚动改变offset
    _timer =Timer.periodic(widget.duration, (timer){
      double newOffset =_controller.offset + widget.stepOffset;   //控制器加上偏移值
      if(newOffset !=_offset){
        _offset =newOffset;
        _controller.animateTo(_offset,duration:widget.duration,curve:Curves.linear);      //过Curve(曲线)来描述动画过程,Curve可以是线性的
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();        //记得清理掉timer计时器和控制器
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection:Axis.horizontal,        //这句是为了ListView的方向
      controller: _controller,                //绑上了控制器
      itemBuilder:(context,index){
        return widget.child;                //直接返回参数传里来的组件如Text,Image
      }
    );
  }
}