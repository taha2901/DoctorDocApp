import 'package:dio/dio.dart';
import 'package:doc/core/networking/api_constants.dart';
import 'package:doc/features/home/data/apis/home_api_constants.dart';
import 'package:doc/features/home/data/models/specializations_response_model.dart';

class HomeApiServices {
  final Dio _dio;

  HomeApiServices(this._dio) {
    // لو الـ Dio معمول له baseUrl بالفعل في setup عام، شيل السطر ده
    _dio.options.baseUrl = ApiConstants.apiBaseUrl;
  }

  Future<SpecializationsResponseModel> getSpecializations() async {
    final response = await _dio.get(HomeApiconstants.specializationEP);
    return SpecializationsResponseModel.fromJson(response.data);
  }
}
