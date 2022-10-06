import 'dart:convert';

import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:toutiao_demo/api/data_utils.dart';
import 'package:toutiao_demo/models/news_data.dart';
import '../widgets/NewsItem.dart';

class NewsList extends StatefulWidget{//动态加载数据列表
  @override
  _NewsListState createState() => new _NewsListState();
}

class _NewsListState extends State<NewsList> {  
  List<Widget> children = [];
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 10,
      itemBuilder: (context,index){
        return Center(
          child: FutureBuilder(
            future: DataUtils.NextJP('r'),
            builder:(BuildContext context, AsyncSnapshot snapshot){
              print( '宽度360的尺寸' + ScreenUtil.getInstance().getAdapterSize(375).toString());
              var novels = NewsData.fromJson(json.decode(snapshot.data.toString()));
              List news= novels.data;
              news.forEach((novel) {
                children.add(NewsItem(novel));
              });
              return Column(
                children: children,
              );
            },
          ),
        );
      }, 
      separatorBuilder: (context, index) => Divider(height: 0),
    );
  }
}