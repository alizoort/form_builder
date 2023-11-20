import 'dart:convert';
import 'package:flutter_form_builder/flutter_form_builder.dart';
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
  late GlobalKey<FormBuilderState> formKey;
  ElectricityEMRCController({required this.context,required this.formKey}){
     // Initialize you providers .....
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
         if((formKey.currentState as FormBuilderState).isValid){
          
         }
      }
  }
}