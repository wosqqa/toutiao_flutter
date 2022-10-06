import 'package:flutter/material.dart';

class TabTitleBar extends StatefulWidget{//自定义Tab标题组件
  TabTitleBar({
    this.index
  });

  final double index;

  @override
  _TabTitleBarState createState() => new _TabTitleBarState();
}

class _TabTitleBarState extends State<TabTitleBar> with SingleTickerProviderStateMixin {  
  TabController _tabController;
  List tabs = ["消息", "公告", "评论"];
  
  @override
  void initState() {
    super.initState();
    // 创建Controller  
    _tabController = TabController(length: tabs.length, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return TabBar(   //生成Tab菜单
          controller: _tabController,
          tabs: tabs.map((e) => Tab(text: e)).toList()
        );
  }
}