import 'package:dio/dio.dart';
import 'package:doc/core/networking/api_constants.dart';

import '../../features/book_appoint/data/model/appointment_request_body.dart';
import '../../features/book_appoint/data/model/appointment_response_body.dart';
import '../../features/login/data/models/login_request_body.dart';
import '../../features/login/data/models/login_response_body.dart';
import '../../features/logout/data/logout_response.dart';
import '../../features/my_appointment/data/model/all_appointment_response_body/all_appointment_response_body.dart';
import '../../features/profile/data/model/profile_response_model/profile_response_model.dart';
import '../../features/profile/data/model/update_profile_request_body.dart';
import '../../features/profile/data/model/update_profile_response_body/update_profile_response_body.dart';
import '../../features/search/data/doctor_filter_model.dart';
import '../../features/see_all_doctor/data/model/doctor_spechilizations_response_model/doctor_spechilizations_response_model.dart';
import '../../features/sign_up/data/models/sign_up_request_body.dart';
import '../../features/sign_up/data/models/sign_up_response.dart';

class ApiServices {
  final Dio _dio;

  ApiServices(this._dio) {
    // لو الديو عندك already معمول له baseUrl في مكان تاني، احذف السطر ده
    _dio.options.baseUrl = ApiConstants.apiBaseUrl;
  }

  // =================== Auth ===================

  Future<LoginResponseBody> login(LoginRequestBody loginRequestBody) async {
    final response = await _dio.post(
      ApiConstants.login,
      data: loginRequestBody.toJson(),
    );
    return LoginResponseBody.fromJson(response.data);
  }

  Future<SignupResponseBody> register(SignupRequestBody signUpRequestBody) async {
    final response = await _dio.post(
      ApiConstants.register,
      data: signUpRequestBody.toJson(),
    );
    return SignupResponseBody.fromJson(response.data);
  }

  Future<LogoutResponseBody> logout() async {
    final response = await _dio.post(ApiConstants.logout);
    return LogoutResponseBody.fromJson(response.data);
  }

  // =================== Doctors ===================

  Future<DoctorSpecializationsResponseModel> getSeeAllDoctorSpechilizations() async {
    final response = await _dio.get(ApiConstants.seeAllDoctors);
    return DoctorSpecializationsResponseModel.fromJson(response.data);
  }

  Future<SearchResponseModel> searchDoctors(String name) async {
    final response = await _dio.get(
      ApiConstants.doctorSearch,
      queryParameters: {"name": name},
    );
    return SearchResponseModel.fromJson(response.data);
  }

  // =================== Profile ===================

  Future<ProfileResponseModel> getProfileData() async {
    final response = await _dio.get(ApiConstants.profile);
    return ProfileResponseModel.fromJson(response.data);
  }

  Future<UpdateProfileResponseBody> updateProfile(
    UpdateProfileRequestBody updateProfileRequestModel,
  ) async {
    final response = await _dio.post(
      ApiConstants.updateProfile,
      data: updateProfileRequestModel.toJson(),
    );
    return UpdateProfileResponseBody.fromJson(response.data);
  }

  // =================== Appointments ===================

  Future<AllAppointmentResponseBody> getAllAppointments() async {
    final response = await _dio.get(ApiConstants.appAppointment);
    return AllAppointmentResponseBody.fromJson(response.data);
  }

  Future<AppointmentResponsebody> bookAppointment(
    AppointmentRequestBody appointmentRequestBody,
  ) async {
    final response = await _dio.post(
      ApiConstants.storeAppointment,
      data: appointmentRequestBody.toJson(),
    );
    return AppointmentResponsebody.fromJson(response.data);
  }
}
