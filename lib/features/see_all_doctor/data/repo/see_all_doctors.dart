import 'package:doc/core/networking/api_error_handler.dart';
import 'package:doc/core/networking/api_result.dart';
import 'package:doc/core/networking/api_services.dart';
import 'package:doc/features/see_all_doctor/data/model/doctor_spechilizations_response_model/doctor_spechilizations_response_model.dart';
class SeeAllDoctorsSpecializationRepo {
  final ApiServices _apiService;
  SeeAllDoctorsSpecializationRepo(this._apiService);

  Future<ApiResult<DoctorSpecializationsResponseModel>> getSeeAllDoctorSpecializations() async {
    try {
      final response = await _apiService.getSeeAllDoctorSpechilizations();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}

