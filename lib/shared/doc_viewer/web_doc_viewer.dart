import 'package:flutter/material.dart';

import 'base_doc_viewer.dart';

class DocViewer extends BaseDocViewer {
  @override
  Future<String> getFile(BuildContext context) async{
    print("INSIDE WEB ");
    return "web";
  }

}