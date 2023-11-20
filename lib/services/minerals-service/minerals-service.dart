import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:modee_emrc_app/shared/text_input_component/emrc_text_input_component.dart';
import 'package:modee_emrc_app/shared/upload_component/emrc_upload_component.dart';
import 'package:modee_emrc_app/shared/dropdown/dropdown_input_component.dart';
import './minerals-controller.dart';
import 'package:modee_emrc_app/services/minerals-service/minerals-provider.dart';
import '../../shared/mixins/document-accessor.dart';
import 'package:modee_emrc_app/shared/check-box/check-box.dart';
import '../models/lookup.dart';
import 'package:modee_emrc_app/shared/date-picker/date-picker.dart';
import 'package:provider/provider.dart';
class MineralsEMRCService extends StatefulWidget {
  const MineralsEMRCService({super.key});

  @override
  State<MineralsEMRCService> createState() => _MineralsEMRCServiceState();
}

class _MineralsEMRCServiceState extends State<MineralsEMRCService> {
  final formKey = GlobalKey<FormBuilderState>();
  void Function(PlatformFile? file,String key,DocumentAccessor docAccessor) onChanged = (PlatformFile? file,String key,DocumentAccessor docAccessor){
    if(file!=null){
      docAccessor.setDocument(key,file);
    }
  };
  @override
  Widget build(BuildContext context) {
  
    return FutureBuilder(
      future: MineralsEMRCController(context: context,formKey:formKey).initModule(),
      builder: (BuildContext context,AsyncSnapshot<String> snapshot){
        return Consumer<MineralsEMRCProvider>(
          builder: (context,emrcProvider,child){
            return ListView(
        children: [
        FormBuilder(
              key: formKey,
              onChanged: (){
          
              },
              autovalidateMode: AutovalidateMode.disabled,
              initialValue: const {

              },
              skipDisabled: true,
              child: LayoutBuilder(
                builder: (BuildContext context,BoxConstraints constraints){
                  final availableWidth = constraints.maxWidth;
                  final maxChildWidth = availableWidth <400 ?availableWidth : availableWidth / 2;
                  return Wrap(
                      children: <Widget>[
                                                                           ConstrainedBox(
                          constraints: BoxConstraints(maxWidth: maxChildWidth),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextInputComponent(fieldName: 'firstName', label: 'firstName',validators: [  FormBuilderValidators.required(),
                             ]),
                          ),
                        ),
                                                                                                                                                                                               ConstrainedBox(
                          constraints: BoxConstraints(maxWidth: maxChildWidth),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextInputComponent(fieldName: 'lastName', label: 'lastName',validators: [  FormBuilderValidators.required(),
                             ]),
                          ),
                        ),
                                                                                                                                                                                                                        ConstrainedBox(constraints: BoxConstraints(maxWidth: maxChildWidth),child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: UploadComponent (onChanged: (PlatformFile? file){
                            onChanged(file,file.hashCode.toString(),emrcProvider);
                          },fieldName:'document',label:'document',validators:[FormBuilderValidators.required()]),
                        )),
                                                                                                                                                                                                                    ConstrainedBox(constraints: BoxConstraints(maxWidth: maxChildWidth),child: const Padding(
                      padding: EdgeInsets.all(8.0),
                     child: DatePickerComponent(fieldName: 'dateOfBirth', label: 'dateOfBirth'),
                      )),
                                                                                                                 ]
                  );
                }
              )
            ),
        ElevatedButton(
            onPressed: () {
             MineralsEMRCController(context: context,formKey:formKey).onSubmit();
            },
            child: const Text("Submit")
        )
      ],
    );
          }
        );
      }
    );

  }
}