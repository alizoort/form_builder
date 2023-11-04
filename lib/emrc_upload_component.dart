import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:modee_emrc_app/shared/utility_service/stub_platform_utility_service.dart'
if (dart.library.io) 'package:modee_emrc_app/shared/utility_service/android_platform_utility_service.dart'
if (dart.library.html) 'package:modee_emrc_app/shared/utility_service/web_platform_utility_service.dart';
import 'package:modee_emrc_app/shared/doc_viewer/stub_doc_viewer.dart'
if(dart.library.io) 'package:modee_emrc_app/shared/doc_viewer/android_doc_viewer.dart'
if(dart.library.html) 'package:modee_emrc_app/shared/doc_viewer/web_doc_viewer.dart';
class UploadComponent extends StatefulWidget {
   UploadComponent({super.key});


  @override
  State<UploadComponent> createState() => _UploadComponentState();
}

class _UploadComponentState extends State<UploadComponent> {
  dynamic selectedDocument;
  @override
  Widget build(BuildContext context) {
    return FormBuilderField(
      name:"uploadComponent",
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required()
      ]),
      builder: (FormFieldState<dynamic> field){
        return InputDecorator(
          decoration: InputDecoration(
            labelText:"Upload your document",
            contentPadding: const EdgeInsets.all(8.0),
            border: InputBorder.none,
            errorText: field.errorText
          ),
          child: GestureDetector(
            onTap: ()async{
              FilePickerResult? result = await FilePicker.platform.pickFiles(allowMultiple: true,withData:true,withReadStream: true);
              if (result != null) {
              await   PlatformUtilityService().downloadFile(result.files.first);
              setState((){
                selectedDocument = result.files.first;
              });
              } else {
                // User canceled the picker
              }
            },
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Row (children: [
                      const Icon(Icons.attach_file),
                      Expanded (
                        child: Padding (
                          padding: const EdgeInsets.all(8.0),
                          child: Text(selectedDocument!=null ? selectedDocument.name : ""),
                        ),
                      )
                    ]),
                  ),
                  GestureDetector(onTap:(){
                    DocViewer().openFile(selectedDocument);
                  },child: const Icon(Icons.download))
                ]
              )
            ),
          )
        );
      }
    );
  }
}