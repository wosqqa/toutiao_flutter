

import 'package:toutiao_demo/api/path.dart';

import 'dio.dart';

class DataUtils {
  
  static Future RefreshJP(param) async {
        var _now = new DateTime.now();
        Object params={
            "htps": 1,
            "type": param,
            "recgid": 15356133239132222,
            "qid": 'qid02650',
            "picnewsnum": 1,
            "readhistory":'', 
            "zdnews": '',
            "idx": 0,
            "pgnum": 1,
            "os": "iOS 11_0",
            "sclog": 0,
            "newsnum": 10,
            "pos_pro": "上海",
            "pos_city": "上海",
            "_": _now.millisecondsSinceEpoch
          };
          print('RefreshJP'+_now.millisecondsSinceEpoch.toString());
      return await API.getHttp(PATH.RefreshJP,params);
  }

  static Future GetVideos(param) async {
        var _now = new DateTime.now();
        Object params={
            "htps": 1,
            "type": 'vtuijian',
            "recgid": 15356133239132222,
            "qid": 'qid02650',
            "startkey": param.startkey,
            "picnewsnum": 1,
            "readhistory":'', 
            "zdnews": '',
            "idx": param.idx,
            "pgnum": param.pgnum,
            "os": "iOS 11_0",
            "sclog": 0,
            "newsnum": 10,
            "pos_pro": "上海",
            "pos_city": "上海",
            "_": _now.millisecondsSinceEpoch
          };
          print('GetVideos'+_now.millisecondsSinceEpoch.toString());
      return await API.getHttp(PATH.GetVideos,params);
  }


  static Future Pulldown(param) async {
        var _now = new DateTime.now();
        Object params={
            "htps": 1,
            "type": param.type,
            "recgid": 15356133239132222,
            "startkey": param.startkey,
            "lastkey": param.lastkey.substring(0, param.lastkey.length-1) +"\$",
            "tagskey": "|",
            "qid": 'qid02650',
            "readhistory":'', 
            "zdnews": '',
            "idx": param.idx,
            "pgnum": param.tgnum,
            "os": "iOS 11_0",
            "sclog": 0,
            "pos_pro": "上海",
            "pos_city": "上海",
            "_": _now.millisecondsSinceEpoch
          };
          print('Pulldown》》'+param.type+_now.millisecondsSinceEpoch.toString());
      return await API.getHttp(PATH.Pulldown,params);
  }
  static Future NextJP(param) async {
        var _now = new DateTime.now();
        Object params={
            "htps": 1,
            "type": param.type,
            "recgid": 15356133239132222,
            "startkey": param.startkey,
            "lastkey": param.lastkey.substring(0, param.lastkey.length-1) +"\$",
            "tagskey": "|",
            "qid": 'qid02650',
            "readhistory":'', 
            "newsnum": 20,
            "zdnews": '',
            "idx": param.idx,
            "pgnum": param.npgnum,
            "os": "iOS 11_0",
            "sclog": 0,
            "pos_pro": "上海",
            "pos_city": "上海",
            "_": _now.millisecondsSinceEpoch
          };
          print('NextJP》》'+param.type+_now.millisecondsSinceEpoch.toString());
      return await API.getHttp(PATH.NextJP,params);
  }
}
