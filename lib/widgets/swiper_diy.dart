import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:toutiao_demo/api/data_utils.dart';
import 'package:toutiao_demo/models/news_data.dart';
import '../provider/TabIndex.dart';
import 'package:provider/provider.dart';

class SwiperDiy extends StatefulWidget{//自定义按钮组件
  // final double width;
  // final double height;
  // final List swiperDataList;
  // SwiperDiy(this.width,this.height,this.swiperDataList);
  @override
  _SwiperDiyState createState() => new _SwiperDiyState();
}

class _SwiperDiyState extends State<SwiperDiy> {  
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: DataUtils.RefreshJP('toutiao'),
      builder: (context,snapshot){
        if(snapshot.hasData){
          var list = NewsData.fromJson(json.decode(snapshot.data.toString()));
          List newsImg= list.data;
          return  Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.grey,
                      width: 0.2,
                      style: BorderStyle.solid
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black45,
                        offset: Offset(1,1),
                        blurRadius: 3
                      )
                    ],
                    borderRadius: BorderRadius.circular(7)
                  ),
                  margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  height: 120.0,
                  child: new Swiper(
                    itemBuilder: (BuildContext context,int index){

                      return ClipRRect( //剪裁为圆角矩形
                              borderRadius: BorderRadius.circular(7.0),
                              child: new Image.network("${newsImg[index].miniimg[0].src}",fit: BoxFit.fill),
                            );
                    },
                    itemCount: newsImg.length,
                    // pagination: new SwiperPagination(),
                    // control: new SwiperControl(),
                    pagination: null,
                    control: null,
                    autoplay: true,
                    duration: 1000,
                    onIndexChanged:_onItemChanged,
                    onTap:_onItemTapped,
                  ),
                );
        }else{
          return Center(
            child: Text('加载中'),
          );
        }

      }
    );
  }
  void _onItemTapped(int index) {//点击事件
        // print(index);
  }
  void _onItemChanged(int index) {//index改变事件
        // print(index);
  }
}