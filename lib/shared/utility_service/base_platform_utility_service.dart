import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

abstract class BasePlatformUtilityService {
   Future<FilePickerResult?> pickFile(){
    return FilePicker.platform.pickFiles(withData:true);
  }
   Future<void> downloadFile(PlatformFile file);
   static showBottomSheet(BuildContext context,Widget bottomSheetWidget)async{
     await showModalBottomSheet(
         barrierColor: const Color(0xff00FFFFFF),
         context:  context,
         builder: (BuildContext context) {
           return bottomSheetWidget;
         });
   }
}