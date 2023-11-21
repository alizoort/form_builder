import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './minerals-provider.dart';
import '../../shared/controllers/app-controller.dart';
import 'minerals-rest-service.dart';
class MineralsEMRCController extends AppController {
  BuildContext context;
  late MineralsEMRCProvider serviceProvider;
  late GlobalKey<FormBuilderState> formKey;
  late MineralsEMRCRestService emrcRestService;
  MineralsEMRCController({required this.context,required this.formKey}){
     // Initialize you providers .....
    serviceProvider = Provider.of<MineralsEMRCProvider>(context,listen:false);
    emrcRestService = MineralsEMRCRestService();
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