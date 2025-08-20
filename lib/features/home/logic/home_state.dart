import 'package:doc/core/networking/api_error_handler.dart';
import 'package:doc/features/home/data/models/specializations_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'home_state.freezed.dart';
@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;

  // specializations
  const factory HomeState.specializationsLoading() = SpecializationsLoading;
  const factory HomeState.specializationsSuccess({required List<SpecializationsData?>? specializationDataList}) = SpecializationsSuccess;
  const factory HomeState.specializationsError({required ErrorHandler errorHandler}) = SpecializationsError;

  //Doctors
  const factory HomeState.doctorsSuccess({required List<Doctors?>? data}) = DoctorsSuccess;
  const factory HomeState.doctorsError({required ErrorHandler errorHandler}) = DoctorsError;
}
