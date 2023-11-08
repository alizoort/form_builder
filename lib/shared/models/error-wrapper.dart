import 'app-error.dart';

class ErrorWrapper {
  final List<AppError> appErrors;
  final String title;
  ErrorWrapper({required this.appErrors,required this.title});
}