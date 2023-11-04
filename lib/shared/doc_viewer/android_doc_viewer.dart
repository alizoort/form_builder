import 'dart:io';

import 'package:flutter/material.dart';
import 'package:modee_emrc_app/shared/doc_viewer/base_doc_viewer.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

import '../providers/boot_provider.dart';

class DocViewer extends BaseDocViewer{
  Future<PermissionStatus> requestPermissions() async {
    await Permission.storage.request();
    return Permission.storage.status;
  }
  @override
  Future<String> getFile(BuildContext context) async{
    final Directory repo= await getExternalStorageDirectory() as Directory;
    BootProvider provider = Provider.of<BootProvider>(context,listen:false);
    if(provider.selectedDocumentName.isNotEmpty){
      provider.selectedDocument = File("${repo.path}/${provider.selectedDocumentName}");
      final String filePath = provider.selectedDocument.absolute.path;
      OpenFile.open(filePath);
    }
    return"";
  }

}