import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../doc_viewer/android_doc_viewer.dart';
import '../upload_component/constants.dart';
import '../utility_service/android_platform_utility_service.dart';

class MultiSelectUpload extends StatefulWidget {
  final String label;
  final InputDecoration decoration;
  final String fieldName;
  final List<String? Function(List<PlatformFile>?)> validators;
  final void Function(List<PlatformFile>?)? onChanged;
  const MultiSelectUpload({super.key, required this.label, this.decoration=kUploadInputDecoration, required this.fieldName, required this.validators, this.onChanged});

  @override
  State<MultiSelectUpload> createState() => _MultiSelectUploadState();
}

class _MultiSelectUploadState extends State<MultiSelectUpload> {
  List<PlatformFile> files=[];
  @override
  Widget build (BuildContext context) {
    return FormBuilderField<List<PlatformFile>>(
      name:widget.fieldName,
      onChanged: (List<PlatformFile>? files){
        if(widget.onChanged!=null){
          widget.onChanged!(files);
        }
      },
      builder: (FormFieldState<List<PlatformFile>> field){
       return  InputDecorator(
            decoration: widget.decoration.copyWith(labelText: widget.label,errorText: field.errorText),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
                children:[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GestureDetector(
                          onTap: ()async {
                            FilePickerResult? result = await PlatformUtilityService().pickFile(true);
                            setState((){
                              result!=null ? files = result.files : [];
                              field.didChange(files);
                            });
                          },
                        child: Icon(Icons.attach_file)
                      ),
                    ],
                  ),
                      for(PlatformFile uploadFile in files)
                  Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.black, // Choose the color you want for the border
                          width: 0.5,           // Adjust the width of the border
                        ),
                      ),
                    ),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Row (children: [
                               Expanded (
                                child: GestureDetector(
                                  onTap:(){
                                    DocViewer().openFile(uploadFile);
                                  },
                                  child: Padding (
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(uploadFile.name),
                                  ),
                                ),
                              )
                            ]),
                          ),
                         Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(onTap:(){
                              setState((){
                               files = [];
                                field.didChange(null);
                              });
                            },child: const Icon(Icons.delete)),
                          ),
                           Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(onTap:()async{
                              await   PlatformUtilityService().downloadFile(uploadFile);
                              DocViewer().openFile(uploadFile);
                            },child: const Icon(Icons.download)),
                          )
                        ]
                    ),
                  )
                ]
            )
        );
      }
    );
  }
}