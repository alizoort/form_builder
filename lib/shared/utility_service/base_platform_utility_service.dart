import 'package:file_picker/file_picker.dart';

abstract class BasePlatformUtilityService {
   Future<FilePickerResult?> pickFile(){
    return FilePicker.platform.pickFiles(allowMultiple: true,withData:true,withReadStream: true);
  }
   Future<void> downloadFile(PlatformFile file);
}