import 'package:file_picker/file_picker.dart';
import 'dart:html';

import 'base_platform_utility_service.dart';
class PlatformUtilityService extends BasePlatformUtilityService {
  @override
  Future<void> downloadFile(PlatformFile file) async {
    final Blob blob = Blob([file.bytes]);
    final String url = Url.createObjectUrlFromBlob(blob);
     AnchorElement(href: url)
      ..target = 'webdownload'
      ..download = file.name
      ..click();
    Url.revokeObjectUrl(url);
  }

}