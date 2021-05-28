import 'package:estimators_app/services/auth_services.dart';
import 'package:estimators_app/services/services_base/dio_base.dart';

class ApiBase {
  ApiBase._internal();
  static final ApiBase _apiBase = ApiBase._internal();

  factory ApiBase() => _apiBase;

  static DioBase _dioBase = DioBase();

  final AuthServices authServices = AuthServices(
    dioBase: _dioBase,
  );
}
