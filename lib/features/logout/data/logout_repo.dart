// import 'package:doc/core/networking/api_error_handler.dart';
// import 'package:doc/core/networking/api_result.dart';
// import 'package:doc/core/networking/api_services.dart';
// import 'package:doc/features/logout/data/logout_response.dart';

// class LogoutRepo {
//   final ApiServices _apiService;

//   LogoutRepo( this._apiService);

//   Future<ApiResult<LogoutResponseBody>> logout() async {
//     try {
//       final response = await _apiService.logout();
//       return ApiResult.success(response);
//     } catch (error) {
//       return ApiResult.failure(ErrorHandler.handle(error));
//     }
//   }
// }
