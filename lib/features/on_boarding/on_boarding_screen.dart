import 'package:doc/core/theming/styles.dart';
import 'package:doc/features/on_boarding/widgets/doc_logo_and_name.dart';
import 'package:doc/features/on_boarding/widgets/doctor_image_and_text.dart';
import 'package:doc/features/on_boarding/widgets/get_started_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: 30.h, bottom: 30.h),
            child: Column(
              children: [
                const DocLogoAndName(),
                const DoctorImageAndText(),
                Column(
                  children: [
                    Text(
                      'Manage and schedule all of your medical appointments easily\nwith Docdoc to get a new experience.',
                      style: TextStyles.font13GreyRegular,
                      textAlign:  TextAlign.center,
                    ),
                    Padding(
                     padding:  EdgeInsets.symmetric(horizontal: 30.w),
                      child: const GetStartedButton(),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
