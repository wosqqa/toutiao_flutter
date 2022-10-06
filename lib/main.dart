
import 'package:fluro/fluro.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'pages/splash_page.dart';
import 'provider/loading_data.dart';
import 'provider/menu_pro.dart';
import 'package:provider/provider.dart';
import 'routes/index.dart';
import 'provider/TabIndex.dart';
void main() {
  ///初始化并配置路由
  final router = new Router();
  setDesignWHD(375.0, 667.0, density: 2);//设置设计稿尺寸默认 width:360.0 / height:640.0 / density:3.0
  Routers.configureRoutes(router);
  runApp(MyApp());
}

// void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    print(Routers.router);
    // ChangeNotifierProvider<TabIndex>.value(
    //     notifier: TabIndex(2),
    //     child: MyApp(),
    //   )
  return MultiProvider(//MultiProvider可以添加多个状态管理
          providers: [
            ChangeNotifierProvider(builder: (_) => TabIndex(0)),
            ChangeNotifierProvider(builder: (_) => MenuPro(3)),
            ChangeNotifierProvider(builder: (_) => LoadingParam()),
          ],
          child:MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(//主题参数
              primarySwatch: Colors.blue,
              platform: TargetPlatform.android,
            ),
            onGenerateRoute: Routers.router.generator,
            home: SplashPage()
          )
        );
  }

}

