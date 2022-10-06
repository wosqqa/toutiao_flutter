import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:toutiao_demo/models/json_data.dart';
import 'package:toutiao_demo/models/news_data.dart';
import '../widgets/NewsItem.dart';

class NewsListPage extends StatefulWidget{//自定义按钮组件
  @override
  _NewsListPageState createState() => new _NewsListPageState();
}

class _NewsListPageState extends State<NewsListPage> {  
  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];
    NewsData novels = NewsData.fromJson(json.decode(JsonString.mockdata));
    List<NewsList> news= novels.data;
    news.forEach((novel) {
      children.add(NewsItem(novel));
    });
    return ListView.separated(
      itemCount: news.length,
      itemBuilder: (context,index){
        return Column(
            children: children,
          );
      }, 
      separatorBuilder: (context, index) => Divider(height: 0),
    );
  }
}