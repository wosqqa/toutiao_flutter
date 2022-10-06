

import 'dart:convert';

import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:toutiao_demo/api/data_utils.dart';
import 'package:toutiao_demo/models/news_data.dart';
import 'package:toutiao_demo/provider/loading_data.dart';
import 'package:toutiao_demo/provider/menu_pro.dart';
import 'package:provider/provider.dart';
import 'NewsItem.dart';

class TopMenu extends StatefulWidget {
  TopMenu({Key key, this.index}) : super(key: key);
  final String index;

  @override
  _TopMenuState createState() => _TopMenuState();
}

class _TopMenuState extends State<TopMenu> with SingleTickerProviderStateMixin {

  // @override AutomaticKeepAliveClientMixin
  // bool get wantKeepAlive => true;

  TabController _tabController; //需要定义一个Controller
  List<MenuObj> _tabs =[
    MenuObj("推荐",'toutiao',[],PageParam("||||||||", "lastkey", 0, 0, 0, 10, "toutiao")),
    MenuObj("游戏",'youxi',[],PageParam("||||||||", "lastkey", 0, 0, 0, 10, "youxi")), 
    MenuObj("娱乐",'yule',[],PageParam("||||||||", "lastkey", 0, 0, 0, 10, "yule")),
    MenuObj("健康",'jiankang',[],PageParam("||||||||", "lastkey", 0, 0, 0, 10, "jiankang")),
    MenuObj("社会",'shehui',[],PageParam("||||||||", "lastkey", 0, 0, 0, 10, "shehui")), 
    MenuObj("科技",'keji',[],PageParam("||||||||", "lastkey", 0, 0, 0, 10, "keji")),
    MenuObj("汽车",'qiche',[],PageParam("||||||||", "lastkey", 0, 0, 0, 10, "qiche")),
    MenuObj("人文",'lishi',[],PageParam("||||||||", "lastkey", 0, 0, 0, 10, "tupian")), 
    MenuObj("财经",'caijing',[],PageParam("||||||||", "lastkey", 0, 0, 0, 10, "caijing")),
  ];
  int _tabIndex=0;
  List<Widget> children = [];
  PageParam param ;
  MenuObj tdata;
  @override
  void initState() {
    super.initState();
    tdata= _tabs[_tabIndex];
    param= _tabs[_tabIndex].param;
    DataUtils.RefreshJP(tdata.type).then((ref){
      var novels = NewsData.fromJson(json.decode(ref.toString()));
      param.startkey = novels.endkey+'';
      param.lastkey = novels.newkey;
      param.tgnum = param.tgnum-1;
      param.idx = (param.tgnum-1)*10;
      param.type = tdata.type;
      setState(() {
        tdata.data.addAll(novels.data);
        tdata.param = param;
        print(_tabs.length);
      });
    });
    _tabController = TabController(length:_tabs.length, vsync: this);
    //TabBar监听器
    _tabController.addListener(() => _onTabChanged()); 
  }

  @override
  Widget build(BuildContext context) {
    tdata= _tabs[_tabIndex];
    param= _tabs[_tabIndex].param;
    // 创建Controller 
    return Scaffold(
      appBar: AppBar(
        elevation:0,
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Container(
            // padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
            child:_tabBar(),
        )
      ),
      body: _tabBarView(),
    );
  }
  Widget _tabBar() {
    return TabBar(
        //设置tab是否可水平滑动
        isScrollable: true,
        //控制器
        controller: _tabController,
        //设置tab文字得类型
        labelStyle: TextStyle(fontSize: 14),
        //设置tab选中得颜色
        labelColor: Colors.blue,
        //设置tab未选中得颜色
        unselectedLabelColor: Colors.black45,
        //设置自定义tab的指示器，CustomUnderlineTabIndicator
        tabs: _tabs.map((item) {
                return Tab(
                  child:  Container(
                    // decoration: BoxDecoration(color: Colors.yellow),
                    constraints: BoxConstraints.tightFor(width: ScreenUtil.getInstance().getAdapterSize(34)),
                    child: Text(item.name),
                  )
                );
        }).toList());
  }

  Widget _tabBarView() {
    return TabBarView(
      controller: _tabController,
      children: _tabs.map((item) {
        return _tabBarContainer(_tabs);
      }).toList(),
    );
  }

  Widget _tabBarContainer(List tabs) {
        GlobalKey<EasyRefreshState> _easyRefreshKey = new GlobalKey<EasyRefreshState>();
        return EasyRefresh(
                key: _easyRefreshKey,
                autoLoad: true,
                child: ListView.separated(
                      itemCount: _tabs[_tabIndex].data.length,
                      itemBuilder: (context,index){
                        return new Container(
                            child: NewsItem(_tabs[_tabIndex].data[index])
                        );
                      }, 
                      separatorBuilder: (context, index) => Divider(height: 0),
                ),
                onRefresh: () async{//下拉加载
                  DataUtils.Pulldown(param).then((ref){
                    var novels = NewsData.fromJson(json.decode(ref.toString()));
                    param.startkey = novels.endkey;
                    param.lastkey = novels.newkey;
                    param.tgnum = param.tgnum-1;
                    param.idx = (param.tgnum+1)*10;
                    param.type = _tabs[_tabIndex].type;
                    setState(() {
                        tdata.data.insertAll(0,novels.data);
                        tdata.param = param;
                    });
                  });
                },
                loadMore: () async {//上拉加载更多
                  DataUtils.NextJP(param).then((ref){
                    var novels = NewsData.fromJson(json.decode(ref.toString()));
                    param.startkey = novels.endkey;
                    param.lastkey = novels.newkey;
                    param.npgnum = param.npgnum+1;
                    param.idx = param.npgnum*10;
                    param.type = _tabs[_tabIndex].type;
                    setState(() {
                        tdata.data.addAll(novels.data);
                        tdata.param = param;
                    });
                  });
                },
              );
  }
  void _onTabChanged(){
    param =  Provider.of<LoadingParam>(context).getParam;
    if (_tabController.indexIsChanging) { //判断是否是选中位置发生变化
      if (this.mounted) {  //判断组件是否已被挂载
        this.setState(() {
          _tabIndex = _tabController.index;
          tdata= _tabs[_tabIndex];
          param= _tabs[_tabIndex].param;
          param.type =tdata.type;
          print(_tabs[_tabIndex].data.length);
          if(_tabs[_tabIndex].data.length<10){
            DataUtils.RefreshJP(_tabs[_tabIndex].type).then((ref){
              var novels = NewsData.fromJson(json.decode(ref.toString()));
              param.startkey = novels.endkey;
              param.lastkey = novels.newkey;
              param.pgnum = param.pgnum;
              // Provider.of<LoadingParam>(context).changeParam(param);
              setState(() {
                tdata.data.addAll(novels.data);
                tdata.param = param;
              });
            });
          }
          // news = newsTab[_tabIndex];
          Provider.of<LoadingParam>(context).changeParam(param);//改变参数
          Provider.of<LoadingParam>(context).changeTab(_tabIndex);//改变tab
        });
      }
    }
  }
}