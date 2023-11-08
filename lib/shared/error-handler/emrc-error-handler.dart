import 'package:dio/src/dio_exception.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:modee_emrc_app/shared/error-handler/error-handler.dart';
import 'package:modee_emrc_app/shared/utility_service/base_platform_utility_service.dart';

import '../error-bottom-sheet/error-bottom-sheet.dart';
import '../models/error-wrapper.dart';
import '../utility_service/navigation-service.dart';

class EMRCErrorHandler extends ErrorHandler {
  @override
  void handleError(DioException error, String message, String title) {
    showError(ErrorBottomSheet(errorWrapper: ErrorWrapper(title: error.response?.statusMessage ?? title,appErrors: [])));
  }

  @override
  void showError(Widget bottomSheetWidget) async{
    await BasePlatformUtilityService.showBottomSheet(NavigationService.navigatorKey.currentContext as BuildContext, bottomSheetWidget);
  }
  
}