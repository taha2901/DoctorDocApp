import 'package:dio/dio.dart';
import 'package:doc/core/networking/api_services.dart';
import 'package:doc/core/networking/dio_factory.dart';
import 'package:doc/features/book_appoint/data/repo/appointment_repo.dart';
import 'package:doc/features/book_appoint/logic/appointment_cubit.dart';
import 'package:doc/features/home/data/apis/home_api_services.dart';
import 'package:doc/features/home/data/repos/home_repo.dart';
import 'package:doc/features/login/data/repos/login_repo.dart';
import 'package:doc/features/login/logic/cubit/login_cubit.dart';
import 'package:doc/features/my_appointment/data/repo/all_appointment_repo.dart';
import 'package:doc/features/my_appointment/logic/all_appointments_cubit.dart';
import 'package:doc/features/profile/data/repo/profile_repo.dart';
import 'package:doc/features/profile/logic/profile_cubit.dart';
import 'package:doc/features/search/data/doctor_filter_repo.dart';
import 'package:doc/features/search/logic/doctor_filter_cubit.dart';
import 'package:doc/features/see_all_doctor/data/repo/see_all_doctors.dart';
import 'package:doc/features/see_all_doctor/logic/see_all_doctors_specialization_cubit.dart';
import 'package:doc/features/sign_up/data/repo/sign_up_repo.dart';
import 'package:doc/features/sign_up/logic/cubit/sign_up_cubit.dart';
import 'package:get_it/get_it.dart';

final getit = GetIt.instance;

Future<void> setUpGetIt() async {
  //dio & ApiServices
  Dio dio = DioFactory.getDio();
  getit.registerLazySingleton<ApiServices>(() => ApiServices(dio));

  //login
  getit.registerLazySingleton<LoginRepo>(() => LoginRepo(getit()));
  getit.registerFactory<LoginCubit>(() => LoginCubit(getit()));

  // signup
  getit.registerLazySingleton<SignupRepo>(() => SignupRepo(getit()));
  getit.registerFactory<SignupCubit>(() => SignupCubit(getit()));

  //home
  getit.registerLazySingleton<HomeApiServices>(() => HomeApiServices(dio));
  getit.registerLazySingleton<HomeRepo>(() => HomeRepo(getit()));
  // getit.registerFactory<HomeCubit>(() => HomeCubit(getit()));

  //see all doctors
  getit.registerFactory<SeeAllDoctorsSpecializationCubit>(
      () => SeeAllDoctorsSpecializationCubit(getit()));
  getit.registerLazySingleton<SeeAllDoctorsSpecializationRepo>(
      () => SeeAllDoctorsSpecializationRepo(getit()));

  //profile
  getit.registerFactory<ProfileCubit>(() => ProfileCubit(getit()));
  getit.registerLazySingleton<ProfileRepo>(() => ProfileRepo(getit()));

  // search
  getit
      .registerLazySingleton<DoctorFilterRepo>(() => DoctorFilterRepo(getit()));
  getit.registerFactory<DoctorFilterCubit>(() => DoctorFilterCubit(getit()));

  getit.registerLazySingleton<AllAppointmentRepo>(
      () => AllAppointmentRepo(getit()));
  getit
      .registerFactory<AllAppointmentCubit>(() => AllAppointmentCubit(getit()));

  getit.registerLazySingleton<AppointmentRepo>(
    () => AppointmentRepo(getit<ApiServices>()),
  );

  getit.registerFactory<AppointmentCubit>(
    () => AppointmentCubit(getit<AppointmentRepo>()),
  );
}
