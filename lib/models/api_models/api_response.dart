import 'package:estimators_app/models/api_models/api_error.dart';

class ApiResponse {
  final bool done;
  final bool succes;
  final dynamic response;
  final ApiError error;

  ApiResponse({
    this.done = false,
    this.response = false,
    this.error,
    this.succes,
  });
}
