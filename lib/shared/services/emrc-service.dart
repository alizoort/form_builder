import 'package:dio/dio.dart';

import 'app_service.dart';
class EMRCService extends AppService {
  Future<Map<String,dynamic>> getAsyncHeaders()async {
    return  {};
  }
  @override
  setHeaders()async {
    headers={}..addAll(await getAsyncHeaders());
  }
  Future<dynamic> uploadCompanyData(FormData data)async {
    return post('/public/company',data);
  }
}