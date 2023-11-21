import 'package:dio/dio.dart';

import 'app_service.dart';
class EMRCRestService extends AppRestService {
  Future<Map<String,dynamic>> getAsyncHeaders()async {
    return  {};
  }
  @override
  setHeaders()async {
    headers={}..addAll(await getAsyncHeaders());
  }

}