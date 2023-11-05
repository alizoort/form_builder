import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
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
   final List<String? Function(String?)> validators;
   const UploadComponent({super.key,required this.fieldName,required this.label,this.decoration = kUploadInputDecoration,this.validators=const []});


  @override
  State<UploadComponent> createState() => _UploadComponentState();
}

class _UploadComponentState extends State<UploadComponent> {
  PlatformFile? selectedDocument;
  @override
  Widget build(BuildContext context) {
    return FormBuilderField(
      name:widget.fieldName,
      validator: FormBuilderValidators.compose(widget.validators),
      builder: (FormFieldState<dynamic> field){
        return InputDecorator(
          decoration: widget.decoration.copyWith(labelText: widget.label,errorText: field.errorText),
          child: GestureDetector(
            onTap: ()async{
              FilePickerResult? result = await PlatformUtilityService().pickFile();
              if (result != null) {
                print("RESULT ${result.files.first}");
              setState((){
                selectedDocument = result.files.first;
                field.didChange(result.files.first.name);
              });
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
                    if(selectedDocument!=null)  Expanded (
                      child: GestureDetector(
                        onTap:(){
                           DocViewer().openFile(selectedDocument!);
                        },
                        child: Padding (
                          padding: const EdgeInsets.all(8.0),
                          child: Text(selectedDocument!=null ? selectedDocument?.name as String: ""),
                        ),
                      ),
                    )
                  ]),
                ),
                if(selectedDocument!=null) Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(onTap:(){
                    setState(() {
                      selectedDocument=null;
                      field.didChange(null);
                    });
                  },child: const Icon(Icons.delete)),
                ),
                if(selectedDocument!=null) Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(onTap:()async{
                      await   PlatformUtilityService().downloadFile(selectedDocument as PlatformFile);
                      DocViewer().openFile(selectedDocument!);
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