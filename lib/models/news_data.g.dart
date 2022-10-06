// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsData _$NewsDataFromJson(Map<String, dynamic> json) {
  return NewsData(
      json['endkey'] as String,
      json['newkey'] as String,
      json['tagskey'] as String,
      (json['data'] as List)
          ?.map((e) =>
              e == null ? null : NewsList.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$NewsDataToJson(NewsData instance) => <String, dynamic>{
      'endkey': instance.endkey,
      'newkey': instance.newkey,
      'tagskey': instance.tagskey,
      'data': instance.data
    };

ImgList _$ImgListFromJson(Map<String, dynamic> json) {
  return ImgList(
      json['imgheight'] as int, json['imgwidth'] as int, json['src'] as String);
}

Map<String, dynamic> _$ImgListToJson(ImgList instance) => <String, dynamic>{
      'imgheight': instance.imgheight,
      'imgwidth': instance.imgwidth,
      'src': instance.src
    };

NewsList _$NewsListFromJson(Map<String, dynamic> json) {
  return NewsList(
      json['commentcnt'] as int,
      json['ctrtime'] as int,
      json['date'] as String,
      (json['lbimg'] as List)
          ?.map((e) =>
              e == null ? null : ImgList.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      (json['miniimg'] as List)
          ?.map((e) =>
              e == null ? null : ImgList.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['recommendtype'] as String,
      json['rowkey'] as String,
      json['source'] as String,
      json['titledisplay'] as String,
      json['topic'] as String,
      json['type'] as String,
      json['url'] as String,
      json['urlfrom'] as String,
      json['urlpv'] as String,
      json['videoLink'] as String,
      json['videoalltime'] as String,
      json['url02'] as String);
}

Map<String, dynamic> _$NewsListToJson(NewsList instance) => <String, dynamic>{
      'commentcnt': instance.commentcnt,
      'ctrtime': instance.ctrtime,
      'date': instance.date,
      'lbimg': instance.lbimg,
      'miniimg': instance.miniimg,
      'recommendtype': instance.recommendtype,
      'rowkey': instance.rowkey,
      'source': instance.source,
      'titledisplay': instance.titledisplay,
      'topic': instance.topic,
      'type': instance.type,
      'url': instance.url,
      'urlfrom': instance.urlfrom,
      'urlpv': instance.urlpv,
      'videoLink': instance.videoLink,
      'videoalltime': instance.videoalltime,
      'url02': instance.url02
    };
