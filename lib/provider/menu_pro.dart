import 'package:flutter/material.dart';
import 'package:toutiao_demo/models/news_data.dart';

import 'loading_data.dart';
class MenuPro with ChangeNotifier{//1
  int _index = 0;
  String _type = 'toutiao';
  List _menu = [];

  MenuPro(this._index);

  void changeMenu(List menu) {//修改状态 Provider.of<MenuPro>(context).changeMenu(2)
    _menu = menu;
    notifyListeners();//2通知widget改变状态
  }

  void changeIndex(int i,String t) {//修改当前选中 Provider.of<MenuPro>(context).changeIndex(2)
    _index = i;
    _type = t;
    notifyListeners();//2通知widget改变状态
  }

  get getMenuAll => _menu;//获取状态 Provider.of<MenuPro>(context).currIndex

  get getMenuActive => _type;//获取
  get getMenuIndex => _index;//获取
}

class MenuObj{
  String name;
  String type;
  List<NewsList> data;
  PageParam param;
  MenuObj(this.name,this.type,this.data,this.param);
}
