import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:modee_emrc_app/shared/mixins/document-accessor.dart';
import 'package:modee_emrc_app/shared/upload_component/constants.dart';
import 'package:modee_emrc_app/shared/utility_service/stub_platform_utility_service.dart'
if (dart.library.io) 'package:modee_emrc_app/shared/utility_service/android_platform_utility_service.dart'
if (dart.library.html) 'package:modee_emrc_app/shared/utility_service/web_platform_utility_service.dart';
import 'package:modee_emrc_app/shared/doc_viewer/stub_doc_viewer.dart'
if(dart.library.io) 'package:modee_emrc_app/shared/doc_viewer/android_doc_viewer.dart'
if(dart.library.html) 'package:modee_emrc_app/shared/doc_viewer/web_doc_viewer.dart';


class UploadComponent extends StatefulWidget {
   final String label;
   final InputDecoration decoration;
   final String fieldName;
   final List<String? Function(PlatformFile?)> validators;
   const UploadComponent({super.key,required this.fieldName,required this.label,this.decoration = kUploadInputDecoration,this.validators=const []});

  @override
  State<UploadComponent> createState() => _UploadComponentState();
}

class _UploadComponentState extends State<UploadComponent> {
  PlatformFile? uploadFile;
  setUploadFile(FormFieldState<dynamic> field,PlatformFile? file){
    setState((){
      uploadFile =file;
      field.didChange(uploadFile);
    });
  }
  @override
  Widget build(BuildContext context) {
    return FormBuilderField<PlatformFile?>(
      name: widget.fieldName,
      validator: FormBuilderValidators.compose(widget.validators),
      builder: (FormFieldState<dynamic> field){
        return InputDecorator(
            decoration: widget.decoration.copyWith(labelText: widget.label,errorText: field.errorText),
            child: GestureDetector(
              onTap: ()async{
                FilePickerResult? result = await PlatformUtilityService().pickFile();
                if (result != null) {
                  setUploadFile(field, result.files.first);
                } else {
                  // User canceled the picker
                }
              },
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Row (children: [
                        const Icon(Icons.attach_file),
                        if(uploadFile!=null)  Expanded (
                          child: GestureDetector(
                            onTap:(){
                              DocViewer().openFile(uploadFile as PlatformFile);
                            },
                            child: Padding (
                              padding: const EdgeInsets.all(8.0),
                              child: Text(uploadFile!=null ? uploadFile?.name as String: ""),
                            ),
                          ),
                        )
                      ]),
                    ),
                    if(uploadFile!=null) Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(onTap:(){
                       setUploadFile(field,null);
                      },child: const Icon(Icons.delete)),
                    ),
                    if(uploadFile!=null) Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(onTap:()async{
                        await   PlatformUtilityService().downloadFile(uploadFile as PlatformFile);
                        DocViewer().openFile(uploadFile as PlatformFile);
                      },child: const Icon(Icons.download)),
                    )
                  ]
              ),
            )
        );
      }
    );
  }
}