import 'package:dio/dio.dart';
import 'package:doc/core/networking/api_constants.dart';
import 'package:doc/features/book_appoint/data/model/appointment_request_body.dart';
import 'package:doc/features/book_appoint/data/model/appointment_response_body.dart';
import 'package:doc/features/login/data/models/login_request_body.dart';
import 'package:doc/features/login/data/models/login_response_body.dart';
import 'package:doc/features/logout/data/logout_response.dart';
import 'package:doc/features/my_appointment/data/model/all_appointment_response_body/all_appointment_response_body.dart';
import 'package:doc/features/profile/data/model/profile_response_model/profile_response_model.dart';
import 'package:doc/features/profile/data/model/update_profile_request_body.dart';
import 'package:doc/features/profile/data/model/update_profile_response_body/update_profile_response_body.dart';
import 'package:doc/features/search/data/doctor_filter_model.dart';
import 'package:doc/features/see_all_doctor/data/model/doctor_spechilizations_response_model/doctor_spechilizations_response_model.dart';
import 'package:doc/features/sign_up/data/models/sign_up_request_body.dart';
import 'package:doc/features/sign_up/data/models/sign_up_response.dart';
import 'package:retrofit/retrofit.dart';

part 'api_services.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiServices {
  factory ApiServices(Dio dio, {String baseUrl}) = _ApiServices;

  @POST(ApiConstants.login)
  Future<LoginResponseBody> login(
    @Body() LoginRequestBody loginRequestBody,
  );

  @POST(ApiConstants.register)
  Future<SignupResponseBody> register(
    @Body() SignupRequestBody signUpRequestBody,
  );

  @POST(ApiConstants.logout)
  Future<LogoutResponseBody> logout();
  
  @GET(ApiConstants.seeAllDoctors)
  Future<DoctorSpecializationsResponseModel> getSeeAllDoctorSpechilizations();

  @GET(ApiConstants.profile)
  Future<ProfileResponseModel> getProfileData();

  @POST(ApiConstants.updateProfile)
  Future<UpdateProfileResponseBody> updateProfile(
    @Body() UpdateProfileRequestBody updateProfileRequestModel,
  );

  @GET(ApiConstants.doctorSearch)
  Future<SearchResponseModel> searchDoctors(@Query("name") String name);

  @GET(ApiConstants.appAppointment)
  Future<AllAppointmentResponseBody> getAllAppointments();

  @POST(ApiConstants.storeAppointment)
  Future<AppointmentResponsebody> bookAppointment(
    @Body() AppointmentRequestBody appointmentRequestBody,
  );
}
