import 'package:flutter/material.dart';

class BottomHoleBar extends StatefulWidget{//自定义打洞底部Tab组件
  BottomHoleBar({
    this.index
  });

  final double index;
  @override
  _BottomBarState createState() => new _BottomBarState();
}

class _BottomBarState extends State<BottomHoleBar> {  
  int _counter = 0;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BottomAppBar(
        color: Colors.white,
        shape: CircularNotchedRectangle(), // 底部导航栏打一个圆形的洞
        child: Row(
          children: [
            IconButton(icon: Icon(Icons.home)),
            SizedBox(), //中间位置空出
            IconButton(icon: Icon(Icons.business)),
          ],
          mainAxisAlignment: MainAxisAlignment.spaceAround, //均分底部导航栏横向空间
        )
      );
  }
  void _onItemTapped(int index) {
        print(index);
        setState(() {
          _counter = index;
        });
  }
}