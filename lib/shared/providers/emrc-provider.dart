import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:modee_emrc_app/shared/mixins/document-accessor.dart';

class EMRCProvider extends ChangeNotifier with DocumentAccessor{
  @override
  setDocument(String documentKey, PlatformFile? file) {
    super.setDocument(documentKey, file);
    notifyListeners();
  }
}