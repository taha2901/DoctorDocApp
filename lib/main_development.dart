import 'package:doc/core/di/dependency_injection.dart';
import 'package:doc/core/helpers/api_key.dart';
import 'package:doc/core/helpers/constants.dart';
import 'package:doc/core/helpers/extentions.dart';
import 'package:doc/core/helpers/shared_pref_helper.dart';
import 'package:doc/core/routings/app_router.dart';
import 'package:doc/doc_app.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: Colors.white,
    systemNavigationBarIconBrightness: Brightness.dark,
  ));
  await EasyLocalization.ensureInitialized();
  await dotenv.load();
  Stripe.publishableKey = ApiKeys.publicKey;
  setUpGetIt();
  // To fix texts being hidden  bug in flutter_screenutil in release mode
  await ScreenUtil.ensureScreenSize();
  await checkLoggedInUser();
  runApp(DocApp(
    appRouter: AppRouter(),
  ));
}

Future<void> checkLoggedInUser() async {
  String? userToken = await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken);
  if (!userToken.isNullOrEmpty()) {
    isLoggedInUser = true;
  } else {
    isLoggedInUser = false;
  }
}
