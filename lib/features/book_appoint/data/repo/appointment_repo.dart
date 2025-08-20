// appointment_repository.dart
import 'package:doc/core/networking/api_error_handler.dart';
import 'package:doc/core/networking/api_result.dart';
import 'package:doc/core/networking/api_services.dart';
import 'package:doc/features/book_appoint/data/model/appointment_request_body.dart';
import 'package:doc/features/book_appoint/data/model/appointment_response_body.dart';
import 'package:flutter/material.dart';

class AppointmentRepo {
  final ApiServices _apiServices;

  AppointmentRepo(this._apiServices);

  Future<ApiResult<AppointmentResponsebody>> bookAppointment({
  required int doctorId,
  required String startTime,
}) async {
  try {
    final response = await _apiServices.bookAppointment(
      AppointmentRequestBody(
        doctorId: doctorId,
        startTime: startTime,
      ),
    );
    
    debugPrint('Raw API Response: ${response.toString()}');
    
    return ApiResult.success(response);
  } catch (e, stackTrace) {
    debugPrint('Error: $e');
    debugPrint('Stack Trace: $stackTrace');
    return ApiResult.failure(ErrorHandler.handle(e));
  }
}
}
