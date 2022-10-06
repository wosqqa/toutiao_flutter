
import 'dart:convert';

import 'package:fluro/fluro.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:toutiao_demo/api/data_utils.dart';
import 'package:toutiao_demo/models/news_data.dart';
import 'package:toutiao_demo/provider/loading_data.dart';
import 'package:toutiao_demo/routes/index.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerAPP extends StatefulWidget{//自定义按钮组件
  final int index;
  VideoPlayerAPP(this.index);
  @override
  _VideoPlayerAPPState createState() => new _VideoPlayerAPPState();
}

class _VideoPlayerAPPState extends State<VideoPlayerAPP>  with SingleTickerProviderStateMixin {  
  VideoPlayerController _controller;
  bool _isPlaying = false;
  String url = 'https://mv.eastday.com/vvideo/20191031/20191031200308237900879_1.mp4';
  List<NewsList> _videoList = [];
  @override
  void initState(){
    super.initState();
    // _controller = VideoPlayerController.network(this.url)
    //     // 播放状态
    //     ..addListener(() {
    //         final bool isPlaying = _controller.value.isPlaying;
    //         if (isPlaying != _isPlaying) {
    //             setState(() { _isPlaying = isPlaying; });
    //         }
    //     })
    //     // 在初始化完成后必须更新界面
    //     ..initialize().then((_) {
    //         setState(() {});
    //     });
    //     tdata= _tabs[_tabIndex];
    // param= _tabs[_tabIndex].param;
    DataUtils.GetVideos(PageParam("||||||||", "lastkey", 0, 0, 0, 10, "toutiao")).then((ref){
      var novels = NewsData.fromJson(json.decode(ref.toString()));
      print(novels.endkey);
      // param.startkey = novels.endkey+'';
      // param.lastkey = novels.newkey;
      // param.tgnum = param.tgnum-1;
      // param.idx = (param.tgnum-1)*10;
      // param.type = tdata.type;
      setState(() {
        _videoList.addAll(novels.data);
        // tdata.param = param;
        // print(_tabs.length);
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return  ListView.separated(
              padding: const EdgeInsets.fromLTRB(10, 30, 10, 10),
              itemCount:_videoList.length,
              itemBuilder: (context, index) {
                print(_videoList[index].url02);
                var _videoalltime = FilterDateTime(_videoList[index].videoalltime);
                return  GestureDetector(
                  child:Column(
                    children: <Widget>[
                        Stack(
                          alignment: const FractionalOffset(0.5, 0.5),  
                          children: <Widget>[
                            ClipRRect(
                                borderRadius: BorderRadius.circular(5.0),
                                child: Image.network(
                                    _videoList[index].miniimg[0].src,
                                    fit: BoxFit.fill, 
                                  ),
                            ),
                            Image.memory(//base64图片显示
                                    base64.decode(
                                    'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAIQAAACEBAMAAACjap6UAAAABGdBTUEAALGPC/xhBQAAAAFzUkdCAK7OHOkAAAAwUExURQAAAAAAAP///////1JSUv///////7+/v+jo6P39/aampv///////////+fn55aWlqDnGJgAAAAQdFJOU00A/oJRan2iSVtNdSoQ0YJaJIZgAAADm0lEQVRo3u3aS0sbURQA4LsYSMxGshASOtncTXdxETIYksIsFKqLQogJiu6GSH1B6C+IWAvpA5TEEKSFLERauyqiSLWLECItXQVBWroT123pDyidmc6kSeY+9Wg3nnX4mDvnzMy95wQFrxzolrgpIvKxlD0wtMVs7Xn7UoRa2otpR1kzjoxYstaQJiIlQ8vWdrdHzZjYLWUNrdaWI75ktOmno6gTo683jfgLGeKTkd/SUU8ob3LaS3GiFZveRp6Y2IzNihItbUpHhFDWjFkxoqVtEQVrMSTDS3ylCrbxik+EjCmqYK1FW+ERkcwhQzCNZ/E2hzhJ1BEzAuUlNhFOVhAn7u9tsIhIZgpxY61vKb3EN94y7KVUP9AJda6CBGJ8rkElmuxs/MtKikaoySISCv9eg0I0D5Fg9FwGusRF9F1GF3EmfBHmZSyTiMhBUZzwL7YJxNC8Lk4o1TSBKFeQRIwnvIQar8sQgUzDQ5y9R1LxdtlD5IpyhD/fT4QSuhyhlFf6CNl1dK3EJcpFWcKf6CXUuC5LKG5OHGLoIZKOJ+keolmRJ8ZTPUTOU1e+Are6FrsJ1ZtSX/QnN62NLmJowfMDH47y7vBOuotoThIIfJdDjKW6CEJVmAQeFqoMm4jkdQLxHeMf7JuRa3eIUAIRiMIvjC+Yxt/HBFHupkWgRxgX+PfTJk4nyYRyjpmpHbvXIVbXyQQaPGemdmCkQ1TrFAINMlMbmO8QhIQ4BLs8lJxLqISEuAR6wEqtXeIWERphEOg3I7WrKw4RXmARrNTubDjEnUkmYaYWU1I79s4hTtmEXR46vTAsornOJuipHUg5xGqRQ1BT6x9xiTqPoKU24BJVPkFJrV2eFjEjQJBTG9h3CV2AsAxPahWX2BciSE++MuMQeSGC9OTbz5kEQUhth4gLEt7UKhk4AmAhorcT4yiiEOJJ1WlJBSgtgAIHeMwAHnaAVw7Ai4/3+h3kv375H4Eo7yMA8CkC+CACfJY5m4Nhgc0BY4viE92iAGyUALZrAJtG+ta1ILp1pW6gL4Q30ADbeIjDBMCRBuBgFTy48vEO4pAJcNQFOHADHPshmg8ALRCARgxEO0iyKaUQmlIArTGIBh1AmxCgWQnRMgVo3EK0jwGa2BCt9ODneaGG/vH1jhWC4eTjKw43gsET3lIC1aXrH/QAjJsghl4QozezOugDwOObG0NCDEMhRrIQg2GI8TTIkPz2Pwf/h/gD56UtyQp2vzUAAAAASUVORK5CYII='.split(',')[1]),
                                    height:ScreenUtil.getInstance().getAdapterSize(60),    //设置高度
                                    width:ScreenUtil.getInstance().getAdapterSize(60),    //设置宽度
                                    fit: BoxFit.fill,    //填充
                                    gaplessPlayback:true, //防止重绘
                                    alignment: Alignment.center,
                            ),
                            Positioned(
                              right: 10,
                              bottom: 10,
                              child: Text(_videoalltime,style: TextStyle(color: Colors.white)),
                            )
                            
                        ]),
                        Container(
                          padding: const EdgeInsets.fromLTRB(5, 5, 5, 15),
                          color: Colors.white,
                          alignment: Alignment.centerLeft,
                          child: Text(_videoList[index].topic,style: TextStyle(fontSize: ScreenUtil.getInstance().getAdapterSize(16),fontWeight: FontWeight.bold)),
                        ),
                        
                    ]
                  ),
                  onTap: () => goToDetail(_videoList[index].url02),
                  )
                ;
              },
              separatorBuilder: (context, index) => Divider(height: 0)
          );
    //   MaterialApp(
    //   title: 'Video Demo',
    //   home: Scaffold(
    //     body: Center(
    //       child: _controller.value.initialized
    //           ? AspectRatio(
    //               aspectRatio: _controller.value.aspectRatio,
    //               child: VideoPlayer(_controller),
    //             )
    //           : Container(),
    //     ),
    //     floatingActionButton: FloatingActionButton(
    //       onPressed: () {
    //         setState(() {
    //           _controller.value.isPlaying
    //               ? _controller.pause()
    //               : _controller.play();
    //         });
    //       },
    //       child: Icon(
    //         _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
    //       ),
    //     ),
    //   ),
    // );
  }

  void goToDetail(String url){
    String route = "/details?url=${Uri.encodeComponent(url)}";
    print(route);
    Routers.router.navigateTo(context, route,transition: TransitionType.inFromLeft);//fluro 动效跳转
  }
  
  String FilterDateTime(String datetime){
    var dt = (int.parse(datetime) ~/ 60000);
    var ds = (int.parse(datetime) % 60000) ~/ 1000;
      return dt.toString() +':' + ds.toString();
    }
}