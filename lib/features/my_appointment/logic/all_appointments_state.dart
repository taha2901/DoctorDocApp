import 'package:doc/core/networking/api_error_model.dart';
import 'package:doc/features/my_appointment/data/model/all_appointment_response_body/all_appointment_response_body.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'all_appointments_state.freezed.dart';
@freezed
class AllAppointmentsState with _$AllAppointmentsState {
  const factory AllAppointmentsState.initial() = _Initial;
  const factory AllAppointmentsState.loading() = AllAppointmentLoading;
  factory AllAppointmentsState.success(AllAppointmentResponseBody model) = AllAppointmentSuccess;
  const factory AllAppointmentsState.error(ApiErrorModel apiErrorModel) =  AllAppointmentError;
}
