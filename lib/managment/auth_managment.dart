import 'package:estimators_app/models/api_models/api_response.dart';
import 'package:estimators_app/models/register_request_model.dart';
import 'package:estimators_app/services/services_base/api_base.dart';

class AuthManagment {
  Future<ApiResponse> register(RegisterRequestModel model) async {
    var res = await ApiBase().authServices.register(
          model,
        );

    if (res.done && res.succes) {
      print("user registred");
    } else {
      print(
          "user isnt registred ${res.error.statusCode}:${res.error.errorText}");
    }

    return null;
  }
}
