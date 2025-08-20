import 'package:doc/core/di/dependency_injection.dart';
import 'package:doc/core/helpers/constants.dart';
import 'package:doc/core/routings/app_router.dart';
import 'package:doc/core/routings/routers.dart';
import 'package:doc/core/theming/colors.dart';
import 'package:doc/features/book_appoint/logic/appointment_cubit.dart';
import 'package:doc/features/checkout_payment/data/repos/checkout_repo_impl.dart';
import 'package:doc/features/checkout_payment/presentation/manger/payment_cubit.dart';
import 'package:doc/features/login/logic/cubit/app_cubit.dart';
import 'package:doc/features/login/logic/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DocApp extends StatelessWidget {
  final AppRouter appRouter;
  const DocApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => getit<LoginCubit>(),
            ),
            BlocProvider(
              create: (context) => getit<AppointmentCubit>(),
            ),
            BlocProvider(
              create: (_) => PaymenttCubit(CheckoutRepoImpl()),
            ),
          ],
          child: MaterialApp(
            title: 'Doc App',
            theme: ThemeData(
              primaryColor: ColorsManager.mainBlue,
              scaffoldBackgroundColor: Colors.white,
              useMaterial3: true,
            ),
            initialRoute:
                isLoggedInUser ? Routers.bottomNavigation : Routers.login,
            debugShowCheckedModeBanner: false,
            onGenerateRoute: appRouter.generateRoute,
          ),
        );
      },
    );
  }
}
