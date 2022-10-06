import 'package:flutter/material.dart';
import 'package:toutiao_demo/models/news_data.dart';
class LoadingParam with ChangeNotifier {//1
  int _index = 0;
  PageParam _param;
  List<PageParam> _paramList;
  List<NewsList> newsList;

  void changeParam(PageParam param) {//修改状态 Provider.of<TabIndex>(context).changeIndex(2)
    _param = param;
    notifyListeners();//2通知widget改变状态
  }
  void changeTab(int i) {//修改状态 Provider.of<TabIndex>(context).changeIndex(2)
    _index = i;
    notifyListeners();//2通知widget改变状态
  }

  get getParam => _param;
  get getTabIndex => _index;
}

class PageParam {
  String startkey;
  String lastkey;
  int pgnum = 0;
  int tgnum = 0;
  int npgnum = 0;
  int idx;
  String type;

  PageParam(this.startkey,this.lastkey,this.pgnum,this.tgnum,this.npgnum,this.idx,this.type);
}