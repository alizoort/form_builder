import 'package:dio/dio.dart';
import '../error-handler/error-handler.dart';

class AppInterceptor extends Interceptor {
  final ErrorHandler errorHandler;
  final Map<String,dynamic> headers;
  AppInterceptor({required this.errorHandler,required this.headers});
  @override
  void onRequest(RequestOptions options,RequestInterceptorHandler handler){
    Map<String,dynamic> map=options.headers;
    ({ for (var k in headers.keys.where((k)=>k.toLowerCase()!="authorization")) k : headers[k] }).forEach((k,v){
      options.headers[k]=v;
    });
    options.headers["Authorization"]==null && headers["Authorization"]!=null ? options.headers["Authorization"]=headers["Authorization"]:null ;

    return super.onRequest(options, handler);
  }
  @override
  Future<void> onError(DioError err,ErrorInterceptorHandler handler) async{
    super.onError(err, handler);
    if (err.response?.statusCode == 401) {
      errorHandler.handleError(err,
          "ERROR MESSAGE","ERROR MESSAGE");
    }
    else if(err.response?.statusCode== 500){
      errorHandler.handleError(err,
          "ERROR MESSAGE","ERROR MESSAGE");
    }
    else {
      errorHandler.handleError(err,
          "ERROR MESSAGE","ERROR MESSAGE");
    }
  }

}