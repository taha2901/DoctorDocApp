import 'package:doc/core/networking/api_error_handler.dart';
import 'package:doc/core/networking/api_result.dart';
import 'package:doc/features/home/data/apis/home_api_services.dart';
import 'package:doc/features/home/data/models/specializations_response_model.dart';

class HomeRepo {
  final HomeApiServices _homeApiServices;

  HomeRepo(this._homeApiServices);

  Future<ApiResult<SpecializationsResponseModel>> getSpecializations() async {
    try {
      final response = await _homeApiServices.getSpecializations();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}