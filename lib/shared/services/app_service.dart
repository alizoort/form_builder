import 'package:dio/dio.dart';
import 'package:modee_emrc_app/shared/configurations/emrc-config.dart';
import '../error-handler/emrc-error-handler.dart';
import '../error-handler/error-handler.dart';
import '../interceptors/app-interceptor.dart';

abstract class AppRestService {
  Map<String,dynamic> headers ={};
  Dio? dio;
  late String baseUrl = EMRCConfig().eMRCBaseUrl;
  ErrorHandler errorHandler = EMRCErrorHandler();
  initializeDioInstance(){
    dio=Dio(BaseOptions(
        baseUrl:  'http://$baseUrl'
    ));
    dio!.interceptors.add(AppInterceptor(errorHandler: errorHandler, headers: headers));
  }
  setHeaders();
  checkRequestValidity()async{
    if(headers.keys.isEmpty){
      await setHeaders();
    }
    if(dio==null){
      initializeDioInstance();
    }
  }
  Future<dynamic> get(String path,{Map<String,dynamic> ? queryParameters,Map<String,dynamic>? headers})async{
    await checkRequestValidity();
    Response response = await dio!.get(path,queryParameters: queryParameters,options: Options(
        headers: headers
    ));
    return response.data;
  }
  Future<dynamic> put(String path,dynamic data,{Map<String,dynamic> ? queryParameters,Map<String,dynamic>? headers})async{
    await checkRequestValidity();
    Response response = await  dio!.put(path,data: data,queryParameters: queryParameters,options: Options(
        headers: headers
    ));
    return response.data;
  }
  Future<dynamic> post(String path,dynamic data,{Map<String,dynamic> ? queryParameters,Map<String,dynamic>? headers})async{
    await checkRequestValidity();
    Response response = await dio!.post(path,data: data,queryParameters: queryParameters,options: Options(
        headers: headers
    ));
    return response.data;
  }
  Future<dynamic> delete(String path,dynamic data,{Map<String,dynamic> ? queryParameters, Map<String,dynamic>? headers}) async {
    await checkRequestValidity();
    Response response = await dio!.delete(path, data: data, queryParameters : queryParameters, options: Options(
        headers: headers
    ));
    return response.data;
  }
}