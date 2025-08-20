

import 'package:doc/core/networking/api_error_handler.dart';
import 'package:doc/core/networking/api_result.dart';
import 'package:doc/core/networking/api_services.dart';
import 'package:doc/features/sign_up/data/models/sign_up_request_body.dart';
import 'package:doc/features/sign_up/data/models/sign_up_response.dart';

class SignupRepo {
  final ApiServices _apiService;

  SignupRepo(this._apiService);

  Future<ApiResult<SignupResponseBody>> signup(
      SignupRequestBody signupRequestBody) async {
    try {
      final response = await _apiService.register(signupRequestBody);
      return ApiResult.success(response);
    } catch (errro) {
      return ApiResult.failure(ErrorHandler.handle(errro));
    }
  }
}