import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:toutiao_demo/api/dio.dart';
import 'package:toutiao_demo/models/news_data.dart';

class GridList extends StatefulWidget{//自定义按钮组件
  @override
  _GridListState createState() => new _GridListState();
}

class _GridListState extends State<GridList> {
  String showText = '欢迎你来到美好人间';
  
  void _showTestToast(){
    Fluttertoast.showToast(
        msg: "sfsdfdsf",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }
  void showShortToast() {
    Fluttertoast.showToast(
      msg: "This is Long Toast",
      toastLength: Toast.LENGTH_LONG,
    );
  }
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: const EdgeInsets.all(10),
      crossAxisSpacing: 5,
      crossAxisCount: 3,
      children: <Widget>[
        Image.network(
          "https://08imgmini.eastday.com/mobile/20190902/2019090215_911b0183b89d4cc5ba5e28329cdce206_2480_mwpm_03200403.jpg",
          width: 115,
        ),
        Image.network(
          "https://08imgmini.eastday.com/mobile/20190902/2019090215_911b0183b89d4cc5ba5e28329cdce206_2480_mwpm_03200403.jpg",
          width: 115,
        ),
        Image.network(
          "https://08imgmini.eastday.com/mobile/20190902/2019090215_911b0183b89d4cc5ba5e28329cdce206_2480_mwpm_03200403.jpg",
          width: 115,
        ),
        Image.network(
          "https://08imgmini.eastday.com/mobile/20190902/2019090215_911b0183b89d4cc5ba5e28329cdce206_2480_mwpm_03200403.jpg",
          width: 115,
        ),
        CircleAvatar(
            backgroundImage: new NetworkImage('https://08imgmini.eastday.com/mobile/20190902/2019090215_911b0183b89d4cc5ba5e28329cdce206_2480_mwpm_03200403.jpg'),
            radius: 10.0,
        ),
        Stack(
          alignment: const FractionalOffset(0.6, 0.8),
          children: <Widget>[
            CircleAvatar(
                backgroundImage: new NetworkImage('https://08imgmini.eastday.com/mobile/20190902/2019090215_911b0183b89d4cc5ba5e28329cdce206_2480_mwpm_03200403.jpg'),
                radius: 100.0,
            ),
            Image.network(
              "https://08imgmini.eastday.com/mobile/20190902/2019090215_911b0183b89d4cc5ba5e28329cdce206_2480_mwpm_03200403.jpg",
              width: 50,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              height: 50,
              child: Text(showText),
            )
          ],
        ),
        RaisedButton(
          child: Text("请求"),
          onPressed: () {
            _onItemTapped(115);
          },
        ),
        RaisedButton(
          child: Text("我就看看toast"),
          onPressed: () {
            showShortToast();
          },
        ),
        Container(
          padding: const EdgeInsets.all(10),
          height: 50,
          child: Text(showText),
        ),
        Column(
          children: <Widget>[
            Text(showText),
          ],
        ),
        Html(
          data: """
            <!--For a much more extensive example, look at example/main.dart-->
            <div style='color:red'>
              我是HTML
            </div>
          """,
          //Optional parameters:
          padding: EdgeInsets.all(8.0),
          backgroundColor: Colors.white70,
          defaultTextStyle: TextStyle(fontFamily: 'serif'),
          linkStyle: const TextStyle(
            color: Colors.redAccent,
          ),
        )
      ],
    );
  }
  void _onItemTapped(int index) {
        print(index);
        Object params={
            "htps": 1,
            "type": "toutiao",
            "recgid": 15356133239132222,
            "qid": '',
            "picnewsnum": 1,
            "readhistory":'', 
            "zdnews": '',
            "idx": 0,
            "pgnum": 1,
            "os": "iOS 11_0",
            "sclog": 0,
            "newsnum": 2,
            "pos_pro": "上海",
            "pos_city": "上海",
            "_": 1568797247744
          };
        API.getHttp("https://toutiao.eastday.com/toutiao_h5/RefreshJP",params).then((val){
          print(json.decode(val));
          NewsData novels = NewsData.fromJson(json.decode(val));
          print(novels.data.toString());
          setState(() {
            showText=novels.endkey;
          });
        });
  }
}