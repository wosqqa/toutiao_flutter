import 'package:flutter/material.dart';
import '../provider/TabIndex.dart';
import 'package:provider/provider.dart';

class BottomBar extends StatefulWidget{//自定义按钮组件
  @override
  _BottomBarState createState() => new _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {  
  Object _barStyle = TextStyle(
                color: Colors.blue,
                fontSize: 12,
              );
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home),title: Text('新闻',style: _barStyle)),
          BottomNavigationBarItem(icon: Icon(Icons.voice_chat),title: Text('视频',style:  _barStyle)),
           BottomNavigationBarItem(icon: Icon(Icons.games),title: Text('游戏中心',style: _barStyle)),
          BottomNavigationBarItem(icon: Icon(Icons.format_list_numbered),title: Text('任务',style: _barStyle)),
          BottomNavigationBarItem(icon: Icon(Icons.contacts),title: Text('我的',style: _barStyle)),
        ],
        fixedColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        currentIndex: Provider.of<TabIndex>(context).currIndex,
        onTap: _onItemTapped
      );
  }
  void _onItemTapped(int index) {
        print(index);
        Provider.of<TabIndex>(context).changeIndex(index);
  }
}