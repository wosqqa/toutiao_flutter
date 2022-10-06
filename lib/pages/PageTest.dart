
import 'package:flutter/material.dart';
import 'package:toutiao_demo/widgets/top_menu.dart';
import 'package:toutiao_demo/widgets/video_list.dart';
import './NewsMsg.dart';
import '../widgets/GridList.dart';
import '../provider/TabIndex.dart';
import 'package:toutiao_demo/widgets/BottomBar.dart';
import 'package:provider/provider.dart';

import 'my.dart';

class PageTest extends StatefulWidget{//自定义按钮组件
  @override
  _PageTestState createState() => new _PageTestState();
}

class _PageTestState extends State<PageTest> {  
  @override
  Widget build(BuildContext context) {
    List<Widget> list = List();
    list..add(TopMenu())
        ..add(VideoList(1))
        ..add(NewsMsg())
        ..add(GridList())
        ..add(MyInfo());
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Flutter头条"),
      // ),
      body: list[Provider.of<TabIndex>(context).currIndex],
      bottomNavigationBar: BottomBar()
    );
  }

}