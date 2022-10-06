

import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int _selectedIndex = 0;
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(
              image: NetworkImage(
                  "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4"),
              width: 100.0,
            ),
            Image.asset("lib/images/wwxx4.png",
              width: 150.0,
              fit: BoxFit.fill,
            ),
            Image(
              image: AssetImage("lib/images/wwxx4.png"),
              width: 50.0
            ),
            Text.rich(TextSpan(
              children: [
                TextSpan(text: '主页：'),
                TextSpan(text: 'http://www.baidu.com',style: TextStyle(color: Colors.blue))
              ]
            )),
            Text(
              '我是一个简单的描述:',
              textAlign: TextAlign.left,
              textScaleFactor: 1.1,
              style: TextStyle(
                color: Colors.red,
                fontSize: 16,
                height: 1.5,
                backgroundColor: Colors.blue,
              ),
            ),
            Text(
              '\uE914',
              style: TextStyle(
                  fontFamily: "MaterialIcons",
                  fontSize: 34.0,
                  color: Colors.red
              ),
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
            FlatButton(
              child: Text("打开一个新的路由页面"),
              textColor: Colors.blue,
              onPressed: () {
                //导航到新路由   
                print('路由跳转');
              },
            ),
            RaisedButton.icon(
              icon: Icon(Icons.send),
              label: Text("发送"),
              onPressed: () {},
            ),
            FlatButton(
              child: Text('提交'),
              textColor: Colors.white,
              color: Colors.blue,
              onPressed: (){},
            )
          ],
        ),
    );
  }
  onTap() {
    print("button click");
  }
}