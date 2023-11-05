import 'package:file_picker/file_picker.dart';

abstract class BasePlatformUtilityService {
   Future<FilePickerResult?> pickFile(){
    return FilePicker.platform.pickFiles(withData:true,withReadStream: true);
  }
   Future<void> downloadFile(PlatformFile file);
}