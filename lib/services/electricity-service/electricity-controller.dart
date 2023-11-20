import 'dart:convert';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:modee_emrc_app/shared/services/emrc-service.dart';
import 'package:provider/provider.dart';
import '../models/company-data.dart';
import '../models/lookup.dart';
import './electricity-provider.dart';
import '../../shared/controllers/app-controller.dart';

class ElectricityEMRCController extends AppController {
  BuildContext context;
  late ElectricityEMRCProvider serviceProvider;
  late EMRCService emrcService;
  late GlobalKey<FormBuilderState> formKey;
  ElectricityEMRCController({required this.context,required this.formKey}){
     // Initialize you providers .....
    emrcService = EMRCService();
    serviceProvider = Provider.of<ElectricityEMRCProvider>(context,listen:false);
  }
  @override
  Future<String> initModule() async {
         return "";
  }
  @override
  Future<void> onSubmit() async {
      if(formKey.currentState!=null){
         formKey.currentState?.save();
         formKey.currentState?.validate();
         print("VALUE ${formKey.currentState?.value}");
         if((formKey.currentState as FormBuilderState).isValid){
           Map<String,dynamic> formDataMap={};
          Map<String,dynamic> map = formKey.currentState?.value as Map<String,dynamic>;
           CompanyData companyData= CompanyData(nameAr:map["nameAr"],nameEn: map["nameEn"],companyNationalIdNumber: int.parse(map['companyNationalIdNumber']),
           taxNumber: int.parse(map["taxNumber"]),registrationNumber: int.parse(map["registrationNumber"]),representativeName: map["representativeName"],
           representativeIsJordanian: map["representativeIsJordanian"],representativeNationalId:int.parse(map["representativeNationalId"]),
           representativeResidentId: int.parse(map["representativeResidentId"]),representativeMobileNumber:map["representativeMobileNumber"],
           companyTypeId: (map["companyTypeId"] as Lookup).id,
           registrationDate: map["registrationDate"].toString().split(" ").first,representativeType:map["representativeType"],companyPhoneNumber:map["companyPhoneNumber"]);
           formDataMap["delegacyDocumentStream"]=MultipartFile.fromBytes((map["delegacyDocumentStream"] as PlatformFile).bytes as Uint8List,filename:map["delegacyDocumentStream"].hashCode.toString() );
           formDataMap["company"]=jsonEncode(companyData.toJson());
           FormData formData = FormData.fromMap(formDataMap);
           emrcService.uploadCompanyData(formData);
         }
      }
  }
}