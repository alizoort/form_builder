import 'base_doc_viewer.dart';

class DocViewer extends BaseDocViewer {
  @override
  Future<String> openFile(dynamic file) async{
    print("INSIDE WEB ");
    return "web";
  }

}