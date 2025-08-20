import 'package:doc/core/networking/api_error_handler.dart';
import 'package:doc/core/networking/api_result.dart';
import 'package:doc/core/networking/api_services.dart';
import 'package:doc/features/search/data/doctor_filter_model.dart';

class DoctorFilterRepo {
  final ApiServices _apiService;
  DoctorFilterRepo(this._apiService);

  Future<ApiResult<List<DoctorFilterResponseModel>>> doctorFilter(String name) async {
    try {
      final response = await _apiService.searchDoctors(name);
      return ApiResult.success(response.data); // ✅ نرجع ليست الدكاترة
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
