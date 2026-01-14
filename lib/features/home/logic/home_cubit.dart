import 'package:doc/core/helpers/extentions.dart';
import 'package:doc/core/networking/api_error_handler.dart';
import 'package:doc/core/networking/api_result.dart';
import 'package:doc/features/home/data/models/specializations_response_model.dart';
import 'package:doc/features/home/data/repos/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo;
  HomeCubit(this._homeRepo) : super(const HomeState.initial());

  List<SpecializationsData?>? specializationsList = [];

  void getSpecializations() async {
    emit(const HomeState.specializationsLoading());

    final result = await _homeRepo.getSpecializations();
    if (isClosed) return;

    if (result is ApiSuccess<SpecializationsResponseModel>) {
      final model = result.data;

      specializationsList = model.specializationDataList ?? [];

      // لو القائمة فاضية متعملش first
      final firstId = specializationsList?.isNotEmpty == true
          ? specializationsList?.first?.id
          : null;

      if (firstId != null) {
        getDoctorsList(specializationId: firstId);
      }

      emit(HomeState.specializationsSuccess(
        specializationDataList: specializationsList,
      ));
      return;
    }

    if (result is ApiFailure<SpecializationsResponseModel>) {
      emit(HomeState.specializationsError(errorHandler: result.errorHandler));
      return;
    }

    // احتياطي
    emit(HomeState.specializationsError(
      errorHandler: ErrorHandler.handle("Unexpected error"),
    ));
  }

  void getDoctorsList({required int? specializationId}) {
    if (isClosed) return;

    final doctorsList = getDoctorsListBySpecializationsId(specializationId);

    if (!doctorsList.isNullOrEmpty()) {
      emit(HomeState.doctorsSuccess(data: doctorsList));
    } else {
      emit(HomeState.doctorsError(
        errorHandler: ErrorHandler.handle("No Data Found"),
      ));
    }
  }

  /// returns list of doctors based on specialization id
  List<Doctors>? getDoctorsListBySpecializationsId(specializationId) {
    return specializationsList
        ?.firstWhere((specialization) => specialization?.id == specializationId)
        ?.doctorsList;
  }
}
