import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:modee_emrc_app/services/electricity-service/company-data.dart';
import 'package:modee_emrc_app/services/electricity-service/electricity-service-provider.dart';
import 'package:modee_emrc_app/shared/services/emrc-service.dart';
import 'package:provider/provider.dart';

import '../../shared/controllers/app-controller.dart';

class ElectricityServiceController extends AppController {
  BuildContext context;
  late ElectricityServiceProvider serviceProvider;
  ElectricityServiceController({required this.context}){
     // Initialize you providers .....
    serviceProvider = Provider.of<ElectricityServiceProvider>(context,listen:false);
  }
  @override
  Future<String> initModule() async {
         EMRCService service = EMRCService();
         CompanyData companyData = CompanyData(nameAr: "اسم الشركة", nameEn: 'Company Name', companyNationalIdNumber: 123456769, taxNumber: 12345678912, registrationNumber: 12345, registrationDate: '2023-10-10', companyPhoneNumber: '071123456', representativeType: 'RrepresentativeType', representativeName: 'RepresentativeName', representativeIsJordanian: true, representativeNationalId: 1234567891, representativeResidentId: 123456789123, representativeMobileNumber: '071-123456', companyTypeId: 1);
         Map<String,dynamic> map = {"company":jsonEncode(companyData.toJson()),};
         for(String docKey in serviceProvider.getDocuments().keys){

           map["delegacyDocumentStream"]=MultipartFile.fromBytes((serviceProvider.getDocument(docKey) as PlatformFile).bytes as Uint8List,filename:(serviceProvider.getDocument(docKey) as PlatformFile).name );
         }
    FormData formData = FormData.fromMap(map);
         await service.uploadCompanyData(formData);
         return "";
  }

}