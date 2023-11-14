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


class UploadComponent extends StatelessWidget {
   final String label;
   final InputDecoration decoration;
   final String fieldName;
   final List<String? Function(String?)> validators;
   final DocumentAccessor documentAccessor;
   const UploadComponent({super.key,required this.documentAccessor,required this.fieldName,required this.label,this.decoration = kUploadInputDecoration,this.validators=const []});

  @override
  Widget build(BuildContext context) {
    return FormBuilderField(
      name: fieldName,
      validator: FormBuilderValidators.compose(validators),
      builder: (FormFieldState<dynamic> field){
        return InputDecorator(
            decoration: decoration.copyWith(labelText: label,errorText: field.errorText),
            child: GestureDetector(
              onTap: ()async{
                FilePickerResult? result = await PlatformUtilityService().pickFile();
                if (result != null) {
                  documentAccessor.setDocument(fieldName, result.files.first);
                  field.didChange(result.files.first.name);
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
                        if(documentAccessor.getDocument(fieldName)!=null)  Expanded (
                          child: GestureDetector(
                            onTap:(){
                              DocViewer().openFile(documentAccessor.getDocument(fieldName) as PlatformFile);
                            },
                            child: Padding (
                              padding: const EdgeInsets.all(8.0),
                              child: Text(documentAccessor.getDocument(fieldName)!=null ? documentAccessor.getDocument(fieldName)?.name as String: ""),
                            ),
                          ),
                        )
                      ]),
                    ),
                    if(documentAccessor.getDocument(fieldName)!=null) Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(onTap:(){
                        documentAccessor.setDocument(fieldName,null);
                        field.didChange(null);
                      },child: const Icon(Icons.delete)),
                    ),
                    if(documentAccessor.getDocument(fieldName)!=null) Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(onTap:()async{
                        await   PlatformUtilityService().downloadFile(documentAccessor.getDocument(fieldName) as PlatformFile);
                        DocViewer().openFile(documentAccessor.getDocument(fieldName) as PlatformFile);
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