import 'package:fluro/fluro.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:toutiao_demo/models/news_data.dart';
import 'package:toutiao_demo/routes/index.dart';

class NewsItem extends StatefulWidget{//自定义按钮组件
  final NewsList item;
  NewsItem(this.item);
  @override
  _NewsItemState createState() => new _NewsItemState();
}

class _NewsItemState extends State<NewsItem> {  
  @override
  Widget build(BuildContext context) {
    NewsList newsData = this.widget.item;
    // ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    return Row(
      children: <Widget>[
        GestureDetector(
        child:newsData.miniimg.length <3 ? buildOneFavoriteView(newsData) : buildFavoriteView(newsData),
        onTap: () => goToDetail(newsData.url),
        )
      ],
    );
    
  }

  void goToDetail(String url){
    String route = "/details?url=${Uri.encodeComponent(url)}";
    print(route);
    Routers.router.navigateTo(context, route,transition: TransitionType.inFromLeft);//fluro 动效跳转
  }

  double rem(double px){
    return ScreenUtil.getInstance().getAdapterSize(px);
  }
  Widget buildFavoriteView(newsData) {
    return  Container(
                width: rem(375),
                padding: EdgeInsets.fromLTRB(rem(10),rem(5),rem(10),rem(10)), //容器外补白
                color: Colors.white,
                child:Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, rem(10), 0, rem(10)),
                      child: Text(newsData.topic, maxLines: 2, overflow: TextOverflow.ellipsis,textAlign: TextAlign.left, style: TextStyle(color: Colors.black,fontSize: rem(17))),
                    ),
                    Flex(
                      direction: Axis.horizontal,
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child:Container(
                                  child: Image.network(
                                        newsData.miniimg[0].src,
                                        width: rem(112),
                                  ),
                                ),
                        ),
                        Expanded(
                          flex: 0,
                          child:Container(
                                  padding: EdgeInsets.fromLTRB(rem(5),0,rem(5) ,0),
                                  child: Image.network(
                                        newsData.miniimg[1].src,
                                        width: rem(116),
                                  ),
                                ),
                        ),
                        Expanded(
                          flex: 1,
                          child:Container(
                                  child: Image.network(
                                        newsData.miniimg[2].src,
                                        width: rem(112),
                                  ),
                                ),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(newsData.source+'  ',style:TextStyle(color: Colors.red,fontSize: rem(12))),
                        Text(newsData.source+'  ',style:TextStyle(color: Colors.grey,fontSize: rem(12))),
                        Text(newsData.urlpv+'阅读  ',style:TextStyle(color: Colors.grey,fontSize: rem(12))),
                      ],
                    )
                    
                  ],
                )
          );
  }

  Widget buildOneFavoriteView(newsData) {
    return  Container(
                width: rem(375),
                padding: EdgeInsets.fromLTRB(rem(10),rem(5),rem(10),rem(10)), //容器外补白
                color: Colors.white,
                child:Flex(
                      direction: Axis.horizontal,
                      children: <Widget>[
                        Expanded(
                          flex: 2,
                          child: Column(
                            children: <Widget>[
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, rem(10), 0, rem(10)),
                              child: Text(newsData.topic, maxLines: 2, overflow: TextOverflow.ellipsis,textAlign: TextAlign.left, style: TextStyle(color: Colors.black,fontSize: rem(17.0))),
                            ),
                            Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text('热门  ',style:TextStyle(color: Colors.red,fontSize: rem(12.0))),
                                  Text(newsData.source+'  ',style:TextStyle(color: Colors.grey,fontSize: rem(12.0))),
                                  Text(newsData.urlpv+'阅读  ',style:TextStyle(color: Colors.grey,fontSize: rem(12.0))),
                                ],
                            ),
                            ]
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Padding(
                              padding: EdgeInsets.only(top:0,bottom:0,right: 0,left: rem(7)),
                              child: Image.network(
                                newsData.miniimg[0].src,
                                width: rem(110),
                              ),
                          ),
                        )
                      ],
                    ),
          );
  }
}