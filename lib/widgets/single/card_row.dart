
import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';

class CardRow extends StatefulWidget{//自定义按钮组件
  final Map<String,dynamic> item;
  CardRow(this.item);
  @override
  _CardRowState createState() => new _CardRowState();
}

class _CardRowState extends State<CardRow> {  
  @override
  Widget build(BuildContext context) {
    return Container(
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
            padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
            margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: Flex(
              direction: Axis.horizontal,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child:Column(
                    children: <Widget>[
                      Image.asset("lib/assets/images/aqq.png",fit: BoxFit.cover,width: ScreenUtil.getInstance().getAdapterSize(50),),
                      Text('提现兑换',style: TextStyle(fontSize: 12),)
                    ],
                  )
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: <Widget>[
                      Image.asset("lib/assets/images/face.png",fit: BoxFit.cover,width: ScreenUtil.getInstance().getAdapterSize(50),),
                      Text('收入记录',style: TextStyle(fontSize: 12))
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: <Widget>[
                      Image.asset("lib/assets/images/pyq.png",fit: BoxFit.cover,width: ScreenUtil.getInstance().getAdapterSize(50),),
                      Text('邀请好友',style: TextStyle(fontSize: 12))
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: <Widget>[
                      Image.asset("lib/assets/images/weixin.png",fit: BoxFit.cover,width: ScreenUtil.getInstance().getAdapterSize(50),),
                      Text('好友列表',style: TextStyle(fontSize: 12))
                    ],
                  ),
                )
              ],
            ),
          );
  }
}

