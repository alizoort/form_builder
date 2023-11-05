import 'package:file_picker/file_picker.dart';
import 'package:modee_emrc_app/shared/doc_viewer/base_doc_viewer.dart';
import 'package:open_file/open_file.dart';
import 'package:permission_handler/permission_handler.dart';

class DocViewer extends BaseDocViewer{
  Future<PermissionStatus> requestPermissions() async {
    await Permission.storage.request();
    return Permission.storage.status;
  }
  @override
  Future<String> openFile(PlatformFile file) async{
    if(file.name.isNotEmpty){
      final String filePath = file.path as String;
      OpenFile.open(filePath);
    }
    return"";
  }

}