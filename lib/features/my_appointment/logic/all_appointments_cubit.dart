
import 'package:doc/core/networking/api_error_handler.dart';
import 'package:doc/core/networking/api_result.dart';
import 'package:doc/features/my_appointment/data/model/all_appointment_response_body/all_appointment_response_body.dart';
import 'package:doc/features/my_appointment/data/repo/all_appointment_repo.dart';
import 'package:doc/features/my_appointment/logic/all_appointments_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class AllAppointmentCubit extends Cubit<AllAppointmentsState> {
  final AllAppointmentRepo _repo;
  AllAppointmentResponseBody?  allAppointmentResponseBody;

  AllAppointmentCubit(this._repo) : super(const AllAppointmentsState.initial());

  static AllAppointmentCubit get(BuildContext context) =>
      BlocProvider.of(context);

  void getAllAppointments() async {
  emit(const AllAppointmentsState.loading());

  final result = await _repo.getAllAppointments();
  if (isClosed) return;

  if (result is ApiSuccess<AllAppointmentResponseBody>) {
    final data = result.data;
    allAppointmentResponseBody = data;
    emit(AllAppointmentsState.success(data));
    return;
  }

  if (result is ApiFailure<AllAppointmentResponseBody>) {
    emit(AllAppointmentsState.error(result.errorHandler.apiErrorModel));
    return;
  }

  emit(AllAppointmentsState.error(
    ErrorHandler.handle("Unexpected error").apiErrorModel,
  ));
}

}
