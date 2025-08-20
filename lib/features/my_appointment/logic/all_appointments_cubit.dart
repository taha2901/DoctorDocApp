
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
     if (isClosed) return;
    final response = await _repo.getAllAppointments();
    response.when(
      success: (data) {
         if (isClosed) return;
        allAppointmentResponseBody = data;
        emit(AllAppointmentsState.success(data)); 
      },
      failure: (errorModel) {
         if (isClosed) return;
        emit(AllAppointmentsState.error(errorModel.apiErrorModel));
      },
    );
  }
}
