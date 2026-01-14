import 'package:doc/core/networking/api_error_handler.dart';
import 'package:doc/core/networking/api_result.dart';
import 'package:doc/core/networking/api_services.dart';
import 'package:doc/features/my_appointment/data/model/all_appointment_response_body/all_appointment_response_body.dart';
class AllAppointmentRepo {
  final ApiServices _apiService;
  AllAppointmentRepo(this._apiService);

  Future<ApiResult<AllAppointmentResponseBody>> getAllAppointments() async {
    try {
      final response = await _apiService.getAllAppointments();
      return ApiSuccess(response);
    } catch (error) {
      return ApiFailure(ErrorHandler.handle(error));
    }
  }
}

