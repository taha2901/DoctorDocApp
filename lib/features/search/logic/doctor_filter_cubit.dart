import 'package:doc/core/networking/api_error_handler.dart';
import 'package:doc/core/networking/api_result.dart';
import 'package:doc/features/search/data/doctor_filter_model.dart';
import 'package:doc/features/search/data/doctor_filter_repo.dart';
import 'package:doc/features/search/logic/doctor_filter_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DoctorFilterCubit extends Cubit<DoctorFilterState> {
  final DoctorFilterRepo repository;

  DoctorFilterCubit(this.repository) : super(DoctorFilterInitial());

  Future<void> search(String name) async {
    emit(DoctorFilterLoading());

    final ApiResult<List<DoctorFilterResponseModel>> result =
        await repository.doctorFilter(name);

    if (isClosed) return;

    if (result is ApiSuccess<List<DoctorFilterResponseModel>>) {
      final success = result;
      emit(DoctorFilterLoaded(success.data));
      return;
    }

    if (result is ApiFailure<List<DoctorFilterResponseModel>>) {
      final failure = result;
      emit(DoctorFilterError(
        failure.errorHandler.apiErrorModel.message ?? "Unknown error",
      ));
      return;
    }

    emit(DoctorFilterError(
      ErrorHandler.handle("Unexpected error").apiErrorModel.message ??
          "Unexpected error",
    ));
  }
}
