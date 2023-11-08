import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class ElectricityServiceProvider extends ChangeNotifier {
  Map<String,PlatformFile?> _documents = {};
  setDocument(String documentKey,PlatformFile? file){
    _documents[documentKey]= file;
    notifyListeners();
  }
  Map<String,PlatformFile?> getDocuments(){
    return _documents;
  }
  PlatformFile? getDocument(String documentKey){
    return _documents[documentKey];
  }
}