import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:estimators_app/models/api_models/api_error.dart';
import 'package:estimators_app/models/api_models/api_response.dart';

class DioBase {
  DioBase._internal();

  static final DioBase _dioBase = DioBase._internal();

  factory DioBase() => _dioBase;

  var base = "https://api-dev.itestimators.com/api";

  Dio dio = Dio(BaseOptions(validateStatus: (_) => true));

  Future<ApiResponse> post({
    Map<String, dynamic> headers,
    Map<String, dynamic> body,
    String endPoint,
  }) async {
    try {
      print("$base$endPoint");
      print("$headers");
      var data = jsonEncode(body);
      print(data);
      var res = await dio.post(
        "$base$endPoint",
        // data: data,
        // // options: Options(
        // //   headers: headers,
        // // ),
        // options: Options(
        //   contentType: "application/json",
        //   headers: {
        //     "client-id": "application-client",
        //   },
        // ),
      );

      if (res.statusCode == 200 || res.statusCode == 201)
        return ApiResponse(done: true, succes: true, response: res.data);

      return ApiResponse(
        done: true,
        succes: false,
        error: ApiError(
          statusCode: res.statusCode,
          errorText: res.data,
        ),
      );
    } catch (e) {
      return ApiResponse(
        done: false,
        succes: false,
        error: ApiError(
          errorText: e.toString(),
        ),
      );
    }
  }
}
