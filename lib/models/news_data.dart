import 'package:json_annotation/json_annotation.dart';

part 'news_data.g.dart';
//构建语句 》flutter packages pub run build_runner build
@JsonSerializable()
class NewsData{
  final String endkey;
  final String newkey;
  final String tagskey;
  final List<NewsList> data;
  NewsData(this.endkey, this.newkey, this.tagskey, this.data);
  //反序列化
  factory NewsData.fromJson(Map<String, dynamic> json) => _$NewsDataFromJson(json);

  //序列化
  Map<String, dynamic> toJson() => _$NewsDataToJson(this);
}

@JsonSerializable()
class ImgList{
  final int imgheight;
  final int imgwidth;
  final String src;
  ImgList(this.imgheight, this.imgwidth, this.src);
  //反序列化
  factory ImgList.fromJson(Map<String, dynamic> json) => _$ImgListFromJson(json);
  //序列化
  Map<String, dynamic> toJson() => _$ImgListToJson(this);
}

@JsonSerializable()
class NewsList{
  final int commentcnt;
  final int ctrtime;
  final String date;
  final List<ImgList> lbimg;
  final List<ImgList> miniimg;
  final String recommendtype;
  final String rowkey;
  final String source;
  final String titledisplay;
  final String topic;
  final String type;
  final String url;
  final String urlfrom;
  final String urlpv;
  @JsonKey(name: 'video_link')
  final String videoLink;
  final String videoalltime;
  final String url02;

  NewsList(this.commentcnt, this.ctrtime, this.date, this.lbimg, this.miniimg, this.recommendtype, this.rowkey, this.source, this.titledisplay, this.topic, this.type, this.url, this.urlfrom, this.urlpv,this.videoLink,this.videoalltime,this.url02);

  //反序列化
  factory NewsList.fromJson(Map<String, dynamic> json) => _$NewsListFromJson(json);

  //序列化
  Map<String, dynamic> toJson() => _$NewsListToJson(this);
}