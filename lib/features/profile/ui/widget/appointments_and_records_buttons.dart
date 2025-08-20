
import 'package:doc/core/helpers/spacing.dart';
import 'package:doc/core/theming/styles.dart';
import 'package:doc/core/widgets/app_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppointmentAndRecordsButtons extends StatelessWidget {
  const AppointmentAndRecordsButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 40.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: AppTextButton(
              buttonText: 'My Appointment',
              textStyle: TextStyles.font14DarkBlueBold,
              backgroundColor: Colors.grey[200],
              borderRadius:  10,
              onPressed: () {},
            ),
          ),
          verticalSpace(10),
          Expanded(
            child: AppTextButton(
              buttonText: 'Medical records',
              textStyle: TextStyles.font14DarkBlueBold,
              backgroundColor: Colors.grey[200],
              borderRadius:  10,
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
