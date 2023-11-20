import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

mixin DocumentAccessor on ChangeNotifier {

  final Map<String,PlatformFile?> _formDocuments = {};

  setDocument(String documentKey,PlatformFile? file){
    print("INSIDE SET DOCOUMENT ${documentKey}");
    _formDocuments[documentKey]= file;
  }
  Map<String,PlatformFile?> getDocuments(){
    return _formDocuments;
  }
  PlatformFile? getDocument(String documentKey){
    return _formDocuments[documentKey];
  }
}