import 'package:doc/core/networking/api_error_handler.dart';
import 'package:doc/core/networking/api_result.dart';
import 'package:doc/core/networking/api_services.dart';
import 'package:doc/features/logout/data/logout_response.dart';
import 'package:doc/features/profile/data/model/profile_response_model/profile_response_model.dart';
import 'package:doc/features/profile/data/model/update_profile_request_body.dart';
import 'package:doc/features/profile/data/model/update_profile_response_body/update_profile_response_body.dart';

class ProfileRepo {
  final ApiServices _apiService;
  ProfileRepo(this._apiService);

  Future<ApiResult<ProfileResponseModel>> getProfileData() async {
    try {
      final response = await _apiService.getProfileData();
      return ApiSuccess(response);
    } catch (error) {
      return ApiFailure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<UpdateProfileResponseBody>> updateProfile(
      UpdateProfileRequestBody updateProfileRequestModel) async {
    try {
      final response =
          await _apiService.updateProfile(updateProfileRequestModel);

      return ApiSuccess(response);
    } catch (error) {
      return ApiFailure(
        ErrorHandler.handle(error),
      );
    }
  }

  Future<ApiResult<LogoutResponseBody>> logout() async {
    try {
      final response = await _apiService.logout();
      return ApiSuccess(response);
    } catch (error) {
      return ApiFailure(ErrorHandler.handle(error));
    }
  }
}
