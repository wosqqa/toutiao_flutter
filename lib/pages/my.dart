
import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:toutiao_demo/widgets/single/card_row.dart';
import 'package:toutiao_demo/widgets/single/list_item.dart';
import 'package:toutiao_demo/widgets/swiper_diy.dart';

class MyInfo extends StatefulWidget{//自定义按钮组件
  @override
  _MyInfoState createState() => new _MyInfoState();
}

class _MyInfoState extends State<MyInfo> {  
      
  @override
  Widget build(BuildContext context) {
    
    return ListView(
            children: <Widget>[
              Container(
                color: Color.fromRGBO(242, 242, 242, 1),
                height: 150,
                // padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                child: Column(
                  children: <Widget>[
                    ClipOval(child: Image.asset("lib/assets/images/wwxx4.png",fit: BoxFit.cover,width: ScreenUtil.getInstance().getAdapterSize(80))),
                    Text('薇薇导'),
                  ],
                ),
              ),
              Container(
                color: Colors.black12,
                height: 5,
              ),
              // SizedBox(width: 10),
              SwiperDiy(),
              Container(
                color: Colors.black12,
                height: 5,
              ),
              CardRow({'title':'扫一扫',"subTitle":'',"tips":''}),
              Container(
                color: Colors.black12,
                height: 5,
              ),
              ListItems()
            ],
          );
    
  }

  Widget  ListItems(){
    List<Widget> children = [];
    List<dynamic> _listData = [
        {'title':'扫一扫',"subTitle":'',"checkmark":''},
        {'title':'赚钱攻略',"subTitle":'',"tips":''},
        {'title':'好友管理',"subTitle":'',"tips":''},
        {'title':'我的书架',"subTitle":'',"tips":''},
        {'title':'钱包',"subTitle":'福利2',"tips":''},
        {'title':'关注',"subTitle":'',"tips":''},
        {'title':'消息',"subTitle":'',"tips":''},
        {'title':'收藏',"subTitle":'',"tips":''},
        {'title':'反馈与帮助',"subTitle":'',"tips":''},
        {'title':'设置',"subTitle":'',"tips":''},
        ];
         _listData.forEach((res) {
            children.add(ListItem(res));
        });
   return Column(
                children: children,
              );
  }
}