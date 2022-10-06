

import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:toutiao_demo/routes/index.dart';

class NewsMsg extends StatefulWidget {
  NewsMsg({Key key, this.index}) : super(key: key);
  final String index;

  @override
  _NewsMsgState createState() => _NewsMsgState();
}

class _NewsMsgState extends State<NewsMsg> with SingleTickerProviderStateMixin {
  TabController _tabController; //需要定义一个Controller
  List tabs = ["消息2", "公告", "评论","消息2", "公告3", "评论4"];

  @override
  void initState() {
    super.initState();
    // 创建Controller  
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text('sad',style: TextStyle(color: Colors.black)),
        // leading: Builder(builder: (context) {
        //   return IconButton(
        //     icon: Icon(Icons.games, color: Colors.red), //自定义图标
        //     onPressed: () {
        //       // 打开抽屉菜单  
        //       // Navigator.of(context).pushNamed("/new_page");//原生跳转
        //       Routers.router.navigateTo(context, "/newmsg",transition: TransitionType.inFromLeft);//fluro 动效跳转
        //     },
        //   );
        // }),
        // bottom: 
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
        //若不需要自定义，可直接通过
        //indicatorColor 设置指示器颜色
        //indicatorWight 设置指示器厚度
        //indicatorPadding
        //indicatorSize  设置指示器大小计算方式
        // indicator: CustomUnderlineTabIndicator(
        //     strokeCap: StrokeCap.round,
        //     insets: EdgeInsets.only(left: 15, right: 15),
        //     borderSide: BorderSide(width: 4.0, color: Colors.red)),
        tabs: tabs.map((item) {
                return Tab(text: item);
        }).toList());
  }

  Widget _tabBarView() {
    return TabBarView(
      controller: _tabController,
      children: tabs.map((item) {
        return _tabBarContainer(tabs);
      }).toList(),
    );
  }

  Widget _tabBarContainer(List tabs) {
        return Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Text('2019-09-15 09:05:55'),
            ),
            Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: Colors.grey[100],
                ),
                margin: EdgeInsets.fromLTRB(15, 10, 15, 10),
                padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                height: 130,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('昨日奖励提醒2222'),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                      child: Text('您昨日获得1200金币~0.12元，好友进贡1500金币，继续加油哦！查看获取奖励方法>'),
                    ),
                    Row(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text('查看更多',style: TextStyle(fontSize:12,color: Colors.grey[500])),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Text('\uE914',style: TextStyle(fontFamily: "MaterialIcons",fontSize:14,color: Colors.grey[500])),
                          )
                        ],
                      )
                  ],
                ),
            ),
        ],
    );
  }
  
}