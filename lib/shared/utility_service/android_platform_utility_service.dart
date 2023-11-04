import 'dart:io';

import 'package:file_picker/src/platform_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

import 'base_platform_utility_service.dart';

class PlatformUtilityService extends BasePlatformUtilityService {
  Future<PermissionStatus> requestPermissions() async {
      await Permission.storage.request();
      return Permission.storage.status;
  }
  @override
  Future<void> downloadFile(PlatformFile file) async {
    try {
      final Directory directory = await getExternalStorageDirectory() as Directory;
      final PermissionStatus status = await requestPermissions();
      if(status.isGranted){
        final File fileToSave = File('${directory.path}/${file.name}');
        await fileToSave.writeAsBytes(file.bytes as List<int>);
      }
    }
    catch(error){
      print('Error downloading the file: $error');
    }
  }

}