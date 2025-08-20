import 'package:doc/core/networking/api_error_model.dart';
import 'package:doc/features/see_all_doctor/data/model/doctor_spechilizations_response_model/doctor_spechilizations_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'see_all_doctors_specialization_state.freezed.dart';
@freezed
class SeeAllDoctorsState with _$SeeAllDoctorsState {
  const factory SeeAllDoctorsState.initial() = _Initial;
  const factory SeeAllDoctorsState.loading() = SeeAllDoctorsLoading;
  factory SeeAllDoctorsState.success(DoctorSpecializationsResponseModel model) = SeeAllDoctorsSuccess;
  const factory SeeAllDoctorsState.error(ApiErrorModel apiErrorModel) =  SeeAllDoctorsError;
}
