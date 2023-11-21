import 'package:dio/dio.dart';
import 'package:modee_emrc_app/shared/services/emrc-service.dart';

class ElectricityEMRCRestService extends EMRCRestService {
  Future<dynamic> uploadCompanyData(FormData data)async {
    return post('/public/company',data);
  }
}