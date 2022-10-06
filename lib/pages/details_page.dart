import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DetailsWebPage extends StatefulWidget {
  final String url;
  DetailsWebPage(this.url);
  @override
  _WebViewPageState createState() => _WebViewPageState();
}

class _WebViewPageState extends State<DetailsWebPage> {
  WebViewController _controller;
  String _title = "webview";
  @override
  Widget build(BuildContext context) {
    String _url = this.widget.url;
    print('路由参数Url'+ _url);
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text("东方头条"),
        ),
        child: SafeArea(
          child: WebView(
            initialUrl: _url,
            //JS执行模式 是否允许JS执行
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (controller) {
              _controller = controller;
            },
            onPageFinished: (url) {//加载完成后的调用方法
               _controller.evaluateJavascript("document.title").then((result){
                  setState(() {
                    // _title = result;
                  });
                }
              );
            },
            navigationDelegate: (NavigationRequest request) {
              //对于需要拦截的操作 做判断
              if(request.url.startsWith("myapp://")) {
                print("即将打开 ${request.url}");
                
                return NavigationDecision.prevent;
              }
              return NavigationDecision.navigate;
            } ,
            javascriptChannels: <JavascriptChannel>[//web端约定好的js调用方法
              JavascriptChannel(
                name: "share",
                onMessageReceived: (JavascriptMessage message) {
                  print("参数： ${message.message}");
                }
              ),
            ].toSet(),
          ),
        ),
    );
  }
}