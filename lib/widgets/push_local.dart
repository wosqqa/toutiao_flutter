
import 'package:flutter/material.dart';

class PushLocal extends StatefulWidget{//自定义按钮组件
  @override
  _PushLocalState createState() => new _PushLocalState();
}

class _PushLocalState extends State<PushLocal> {  
  String debugLable = 'Unknown';   //错误信息
  // final JPush jpush = new JPush();  //初始化极光插件
  @override
  Widget build(BuildContext context) {
    return Center(
            child: Text('加载中'),
          );
    
  }
}