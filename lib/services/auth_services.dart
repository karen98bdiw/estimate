import 'package:estimators_app/models/api_models/api_response.dart';
import 'package:estimators_app/models/register_request_model.dart';
import 'package:estimators_app/services/services_base/dio_base.dart';

class AuthServices {
  DioBase dioBase;

  AuthServices({this.dioBase});

  Future<ApiResponse> register(
    RegisterRequestModel model,
  ) async {
    var res = await dioBase.post(
      endPoint: "/user/register",
      headers: {
        'Content-Type': 'application/json',
        "client-id": "application-client",
      },
      body: model.toJson(),
    );

    return res;
  }
}
