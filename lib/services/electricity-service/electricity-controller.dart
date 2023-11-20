import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:modee_emrc_app/shared/services/emrc-service.dart';
import 'package:provider/provider.dart';
import './electricity-provider.dart';
import '../../shared/controllers/app-controller.dart';

class ElectricityEMRCController extends AppController {
  BuildContext context;
  late ElectricityEMRCProvider serviceProvider;
  late GlobalKey<FormBuilderState> formKey;
  ElectricityEMRCController({required this.context,required this.formKey}){
    serviceProvider = Provider.of<ElectricityEMRCProvider>(context,listen:false);
  }
  @override
  Future<String> initModule() async {
         Map<String,dynamic> map = {};
         // for(String docKey in serviceProvider.getDocuments().keys){
         //
         //   map["delegacyDocumentStream"]=MultipartFile.fromBytes((serviceProvider.getDocument(docKey) as PlatformFile).bytes as Uint8List,filename:(serviceProvider.getDocument(docKey) as PlatformFile).name );
         // }
         return "";
  }
  onSubmit(){
    if(formKey.currentState!=null && (formKey.currentState as FormBuilderState).isValid){
      formKey.currentState?.save();
      print(formKey.currentState?.isValid);
      formKey.currentState?.validate();
      print("VALUE ${ formKey.currentState?.value}");
    }
  }
}