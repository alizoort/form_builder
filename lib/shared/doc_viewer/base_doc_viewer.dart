import 'package:flutter/material.dart';

abstract class BaseDocViewer {
  Future<String> getFile(BuildContext context);
}
