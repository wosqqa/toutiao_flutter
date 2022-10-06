
import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class NewRoute extends StatelessWidget {
  final Object obj;
  NewRoute({Key key, @required this.obj}) : super(key: key);
  final wordPair = new WordPair.random();
  @override
  Widget build(BuildContext context) {
    var args=ModalRoute.of(context).settings.arguments;
    // debugger(when: args !='');
    print(args);
    bool _switchSelected = true;
    bool _checkboxSelected =true;
    return Scaffold(
      body: Center(
        child: Center(
          child: Column(children: <Widget>[
            Row(
              children: <Widget>[
                Switch(
                  value: _switchSelected,//当前状态
                  onChanged:(value){
                    print(value);
                    // _switchSelected=value;
                  },
                ),
                Checkbox(
                  value: _checkboxSelected,
                  activeColor: Colors.red, //选中时的颜色
                  onChanged:(value){
                    setState(() {
                      _checkboxSelected=value;
                    });
                  } ,
                ),
                Container(
                  padding: EdgeInsets.all(20.0), //容器外补白
                  color: Colors.orange,
                  child: Text("Hello world!"),
                ),
              ],
            ),
            Text('新的路由随机数'+wordPair.toString()),
            RaisedButton(
                onPressed: () => Navigator.pop(context, "我是返回值"),
                child: Text("返回"),
            ),
            RaisedButton(
                onPressed: () => Navigator.pushNamed(context, "new_page",arguments: "hi,命名路由参数").then((data){
                  print('命名回调的'+data);
                }),
                child: Text("命名路由test"),
            ),
            RaisedButton(
                onPressed: () => Navigator.pushNamed(context, "swiper_diy",arguments: "hi,命名路由参数").then((data){
                  print('命名回调的'+data);
                }),
                child: Text("去找Swiper"),
            ),
          ],),
        ),
      ),
    );
  }

  void setState(Null Function() param0) {}
}