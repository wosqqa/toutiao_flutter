import 'dart:io';
import 'package:dio/dio.dart';


class API{
  static Dio _dio;
  static BaseOptions _options = new BaseOptions(
    connectTimeout: 5000,
    receiveTimeout: 3000,
    contentType: ContentType.json,
  );
  static Dio buildDio(){
    if(_dio == null){
      _dio = new Dio(_options);
    }
    return _dio;
  }

  static getHttp(String url,Object params)async{
    try{
      Response response;
      response = await Dio().get(
          url,
          queryParameters:params
      );
      return response.data;
    }catch(e){
      return print(e);
    }
  }

  
  static postHttp(String url,Object params)async{
    try{
      Response response;
      response = await Dio().get(
          url,
          queryParameters:params
      );
      return response.data;
    }catch(e){
      return print(e);
    }
  }

  static get(String url,{options,Function success,Function failure}) async{
    Dio dio = buildDio();
    // try {
      print(options);
      Response response = await dio.get(url,options:options);
      // Map<String ,dynamic> map = json.decode(response.data);
      // Data data = Data.fromJson(json.decode(response.data));
      print('get数据请求');
      success(response.data); 
    // } catch (e) {
    //   success(e);
    // }
  }
  static post(String url,{params,options,Function success,Function failure}) async{
    Dio dio = buildDio();
    try {
      Response response = await dio.post(url,data:params,options:options);
      success(response.data); 
    } catch (e) {
      success(e);
    }
  }
}