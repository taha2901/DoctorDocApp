import 'package:doc/features/book_appoint/data/repo/appointment_repo.dart';
import 'package:doc/features/book_appoint/logic/appointment_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppointmentCubit extends Cubit<AppointmentState> {
  final AppointmentRepo _appointmentRepository;

  AppointmentCubit(this._appointmentRepository) : super(AppointmentInitial());

  void bookAppointment({
  required int doctorId,
  required String startTime,
}) async {
  emit(AppointmentLoading());
  final response = await _appointmentRepository.bookAppointment(
    doctorId: doctorId,
    startTime: startTime,
  );
  if (isClosed) return;

  response.when(
    success: (data) {
      if (isClosed) return;
      emit(AppointmentSuccess(data));
    },
    failure: (error) {
      if (isClosed) return;
      emit(AppointmentError(error.apiErrorModel.message ?? 'Booking failed'));
    },
  );
}

}
