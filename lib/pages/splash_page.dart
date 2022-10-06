

import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:toutiao_demo/routes/index.dart';

class SplashPage extends StatefulWidget {//开屏页面
  SplashPage({Key key}) : super(key: key);
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>{
  bool isStartHomePage = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: goToHomePage,//设置页面点击事件
      child: Image.asset("lib/assets/images/share1.png",fit: BoxFit.cover,),//此处fit: BoxFit.cover用于拉伸图片,使图片铺满全屏
    );
  }

  @override
  void initState() {
    super.initState();
     //开启倒计时
    countDown();
  }

  void countDown() {
    //设置倒计时三秒后执行跳转方法
    var duration = new Duration(seconds: 3);
    new Future.delayed(duration, goToHomePage);
  }
  void goToHomePage(){
    //如果页面还未跳转过则跳转页面
    if(!isStartHomePage){
      //跳转主页 且销毁当前页面
      Routers.router.navigateTo(context, "/",replace: true,transition: TransitionType.fadeIn);//fluro 动效跳转
      isStartHomePage=true;
    }
  }
}