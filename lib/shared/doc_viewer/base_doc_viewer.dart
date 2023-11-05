import 'package:file_picker/file_picker.dart';

abstract class BaseDocViewer {
  Future<String> openFile(PlatformFile file);
}
