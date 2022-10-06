
import 'package:flutter/material.dart';

class Demo extends StatefulWidget{//自定义按钮组件
  final int index;
  Demo(this.index);
  @override
  _DemoState createState() => new _DemoState();
}

class _DemoState extends State<Demo> {  
  @override
  Widget build(BuildContext context) {
    return Center(
            child: Text('加载中'),
          );
    
    
  }
}