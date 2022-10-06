import 'package:flutter/material.dart';
class TabIndex with ChangeNotifier {//1
  int _index;
  TabIndex(this._index);

  void changeIndex(int index) {//修改状态 Provider.of<TabIndex>(context).changeIndex(2)
    _index =index;
    notifyListeners();//2通知widget改变状态
  }
  get currIndex => _index;//3获取状态 Provider.of<TabIndex>(context).currIndex
}