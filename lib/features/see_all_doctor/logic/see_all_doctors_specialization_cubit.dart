
import 'package:doc/features/see_all_doctor/data/model/doctor_spechilizations_response_model/doctor_spechilizations_response_model.dart';
import 'package:doc/features/see_all_doctor/data/repo/see_all_doctors.dart';
import 'package:doc/features/see_all_doctor/logic/see_all_doctors_specialization_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class SeeAllDoctorsSpecializationCubit extends Cubit<SeeAllDoctorsState> {
  final SeeAllDoctorsSpecializationRepo _repo;
  DoctorSpecializationsResponseModel? doctorSpecializationsResponse;

  SeeAllDoctorsSpecializationCubit(this._repo) : super(const SeeAllDoctorsState.initial());

  static SeeAllDoctorsSpecializationCubit get(BuildContext context) =>
      BlocProvider.of(context);

  void getSpecializations() async {
    emit(const SeeAllDoctorsState.loading());

    final response = await _repo.getSeeAllDoctorSpecializations();
    response.when(
      success: (data) {
        doctorSpecializationsResponse = data;
        emit(SeeAllDoctorsState.success(data)); 
      },
      failure: (errorModel) {
        emit(SeeAllDoctorsState.error(errorModel.apiErrorModel));
      },
    );
  }
}
