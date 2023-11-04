import 'package:file_picker/file_picker.dart';

abstract class BasePlatformUtilityService {
  Future<void> downloadFile(PlatformFile file);
}