import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:modee_emrc_app/shared/services/emrc-service.dart';
import 'package:provider/provider.dart';
import '../models/minerals-dto.dart';
import './minerals-provider.dart';
import '../../shared/controllers/app-controller.dart';

class MineralsEMRCController extends AppController {
  BuildContext context;
  late MineralsEMRCProvider serviceProvider;
  late GlobalKey<FormBuilderState> formKey;
  MineralsEMRCController({required this.context,required this.formKey}){
    serviceProvider = Provider.of<MineralsEMRCProvider>(context,listen:false);
  }
  @override
  Future<String> initModule() async {
         return "";
  }
  onSubmit(){
    if(formKey.currentState!=null && (formKey.currentState as FormBuilderState).isValid){
      formKey.currentState?.save();
      print(formKey.currentState?.isValid);
      formKey.currentState?.validate();
      Map<String,dynamic> map = formKey.currentState?.value as Map<String,dynamic>;
      MineralsDTO mineralsDTO = MineralsDTO(arabicName: map["nameEn"],englishName: map["nameAr"],documentAssociationMap: {});
      FormData formData = FormData.fromMap({
        "rawData": mineralsDTO.toJson(),

      });
      print("VALUE ${ formKey.currentState?.value}");
    }
  }
}