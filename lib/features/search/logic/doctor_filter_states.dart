import 'package:doc/features/search/data/doctor_filter_model.dart';

abstract class DoctorFilterState {}

class DoctorFilterInitial extends DoctorFilterState {}

class DoctorFilterLoading extends DoctorFilterState {}

class DoctorFilterLoaded extends DoctorFilterState {
  final List<DoctorFilterResponseModel> doctors;

  DoctorFilterLoaded(this.doctors);
}

class DoctorFilterError extends DoctorFilterState {
  final String message;

  DoctorFilterError(this.message);
}
