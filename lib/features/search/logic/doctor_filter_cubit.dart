import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:doc/features/search/data/doctor_filter_repo.dart';
import 'package:doc/features/search/logic/doctor_filter_states.dart';

class DoctorFilterCubit extends Cubit<DoctorFilterState> {
  final DoctorFilterRepo repository;

  DoctorFilterCubit(this.repository) : super(DoctorFilterInitial());

  Future<void> search(String name) async {
    emit(DoctorFilterLoading());
    final result = await repository.doctorFilter(name);
    result.when(
      success: (doctors) => emit(DoctorFilterLoaded(doctors)),
      failure: (error) => emit(DoctorFilterError(error.apiErrorModel.message ?? "Unknown error")),
    );
  }
}
