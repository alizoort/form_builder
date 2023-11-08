import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

abstract class ErrorHandler {
  void handleError(DioException error,String message,String title);
  void showError(Widget bottomSheetWidget);
}