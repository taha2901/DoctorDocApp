import 'package:doc/core/di/dependency_injection.dart';
import 'package:doc/core/routings/routers.dart';
import 'package:doc/core/widgets/custom_bottom_nav_bar.dart';
// ignore: unused_import
import 'package:doc/features/book_appoint/logic/appointment_cubit.dart';
import 'package:doc/features/book_appoint/ui/book_appoint_screen.dart';
import 'package:doc/features/doctor_information_details/ui/doctor_info_details.dart';
import 'package:doc/features/home/data/models/specializations_response_model.dart';
import 'package:doc/features/home/ui/home_screen.dart';
import 'package:doc/features/login/ui/login_screen.dart';
import 'package:doc/features/on_boarding/on_boarding_screen.dart';
import 'package:doc/features/profile/ui/personal_info.dart';
import 'package:doc/features/see_all_doctor/logic/see_all_doctors_specialization_cubit.dart';
import 'package:doc/features/see_all_doctor/ui/see_all_doctors.dart';
import 'package:doc/features/sign_up/ui/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;
    switch (settings.name) {
      case Routers.onBoarding:
        return MaterialPageRoute(
          builder: (_) => const OnBoardingScreen(),
        );
      case Routers.login:
        return MaterialPageRoute(
          builder: (_) =>  LoginScreen(),
        );
      case Routers.signUp:
        return MaterialPageRoute(
          builder: (_) => const SignupScreen(),
        );
      case Routers.home:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
      case Routers.bottomNavigation:
        return MaterialPageRoute(
          builder: (_) => const CustomBottomNavBar(),
        );
      case Routers.seeAllDoctor:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getit<SeeAllDoctorsSpecializationCubit>()..getSpecializations(),
            child: const DoctorSpecialtiesScreen(),
          ),
        );
      case Routers.doctorInfoDetails:

        return MaterialPageRoute(
          builder: (context) {
            final doctor = settings.arguments as Doctors;
            return DoctorDetailsScreen(doctor:  doctor,);

          },
        );
      case Routers.bookAppointMent:
        return MaterialPageRoute(
          builder: (context) => BookAppointScreen(doctorId: arguments as Doctors ,doctorName:  arguments as Doctors,),
        );
        case Routers.personalInformation:
        return MaterialPageRoute(
          builder: (context) => const PersonalInformation(),
        );
      default:
        return null;
    }
  }
}
