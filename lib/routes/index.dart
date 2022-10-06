import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:toutiao_demo/pages/details_page.dart';
import 'package:toutiao_demo/widgets/swiper_diy.dart';
import '../pages/NewRoute.dart';
import '../pages/PageTest.dart';
import '../pages/NewsMsg.dart';
var users = Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
      return NewRoute(obj:ModalRoute.of(context).settings.arguments);
});
var home = Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
      return PageTest();
});
var newmsg = Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
      return NewsMsg();
});

var detailsPage = Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
      return DetailsWebPage(params['url']?.first);
});

var swiperDiy = Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
      return SwiperDiy();
});

class Routers {
  static Router router;

  static void configureRoutes(Router router) {
    router.define('/', handler: home);
    router.define('/new_page', handler: users);
    router.define('/newmsg', handler: newmsg);
    router.define('/details', handler: detailsPage);         
    router.define('/swiper_diy', handler: swiperDiy);
    Routers.router = router;
  }
}