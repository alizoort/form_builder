import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import '../mixins/document-accessor.dart';


class EMRCProvider extends ChangeNotifier with DocumentAccessor {
  @override
  setDocument(String documentKey, PlatformFile? file) {
    super.setDocument(documentKey, file);
    notifyListeners();
  }
}