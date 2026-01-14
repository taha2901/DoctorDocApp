import 'package:doc/core/networking/api_result.dart';
import 'package:doc/features/book_appoint/data/model/appointment_response_body.dart';
import 'package:doc/features/book_appoint/data/repo/appointment_repo.dart';
import 'package:doc/features/book_appoint/logic/appointment_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppointmentCubit extends Cubit<AppointmentState> {
  final AppointmentRepo _appointmentRepository;

  AppointmentCubit(this._appointmentRepository) : super(AppointmentInitial());

  Future<void> bookAppointment({
    required int doctorId,
    required String startTime,
  }) async {
    emit(AppointmentLoading());

    final result = await _appointmentRepository.bookAppointment(
      doctorId: doctorId,
      startTime: startTime,
    );

    if (isClosed) return;

    if (result is ApiSuccess<AppointmentResponsebody>) {
      emit(AppointmentSuccess(result.data));
      return;
    }

    if (result is ApiFailure<AppointmentResponsebody>) {
      emit(AppointmentError(
        result.errorHandler.apiErrorModel.message ?? 'Booking failed',
      ));
      return;
    }

    emit(AppointmentError('Unexpected error'));
  }
}
