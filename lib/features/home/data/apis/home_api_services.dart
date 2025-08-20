

import 'package:dio/dio.dart';
import 'package:doc/core/networking/api_constants.dart';
import 'package:doc/features/home/data/apis/home_api_constants.dart';
import 'package:doc/features/home/data/models/specializations_response_model.dart';
import 'package:retrofit/retrofit.dart';

part 'home_api_services.g.dart';

@RestApi(baseUrl:  ApiConstants.apiBaseUrl)
abstract class HomeApiServices {
  factory  HomeApiServices(Dio dio) = _HomeApiServices;
  @GET(HomeApiconstants.specializationEP)
  Future<SpecializationsResponseModel> getSpecializations();
}