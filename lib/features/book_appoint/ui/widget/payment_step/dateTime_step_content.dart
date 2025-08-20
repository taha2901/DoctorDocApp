import 'package:flutter/material.dart';
import 'package:doc/core/helpers/spacing.dart';
import 'package:doc/core/theming/styles.dart';
import 'package:doc/features/book_appoint/ui/widget/select_date_row_widget.dart';
import 'package:doc/features/book_appoint/ui/widget/time_slot_selector.dart';
import 'package:doc/features/book_appoint/ui/widget/appintment_type.dart';
import 'package:doc/features/book_appoint/ui/widget/data_in_home.dart';

class DateTimeStepContent extends StatelessWidget {
  final void Function(DateTime) onDateChange;
  final void Function(String) onTimeSelected;
  final void Function(String) onTypeSelected;

  const DateTimeStepContent({
    super.key,
    required this.onDateChange,
    required this.onTimeSelected,
    required this.onTypeSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          verticalSpace(25),
          const SelectDateRowWidget(),
          verticalSpace(15),
          MyTimeLineHome(
            onDateChange: onDateChange,
          ),
          verticalSpace(15),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Available time', style: TextStyles.font16BlackBold),
              ],
            ),
          ),
          TimeSlotSelector(
            onTimeSelected: onTimeSelected,
          ),
          verticalSpace(15),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Appointment Type', style: TextStyles.font16BlackBold),
              ],
            ),
          ),
          AppointmentTypeSelector(
            onTypeSelected: onTypeSelected,
          ),
        ],
      ),
    );
  }
}
