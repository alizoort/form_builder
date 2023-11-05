import 'package:file_picker/file_picker.dart';

import 'base_doc_viewer.dart';

class DocViewer extends BaseDocViewer {
  @override
  Future<String> openFile(PlatformFile file) async{
    return "web";
  }

}