import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:modee_emrc_app/shared/services/emrc-service.dart';
import 'package:provider/provider.dart';
import './electricity-provider.dart';
import '../../shared/controllers/app-controller.dart';

class ElectricityEMRCController extends AppController {
  BuildContext context;
  late ElectricityEMRCProvider serviceProvider;
  ElectricityEMRCController({required this.context}){
     // Initialize you providers .....
    serviceProvider = Provider.of<ElectricityEMRCProvider>(context,listen:false);
  }
  @override
  Future<String> initModule() async {
         Map<String,dynamic> map = {};
         for(String docKey in serviceProvider.getDocuments().keys){

           map["delegacyDocumentStream"]=MultipartFile.fromBytes((serviceProvider.getDocument(docKey) as PlatformFile).bytes as Uint8List,filename:(serviceProvider.getDocument(docKey) as PlatformFile).name );
         }
         return "";
  }

}