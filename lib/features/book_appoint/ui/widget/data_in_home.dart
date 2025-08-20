import 'package:doc/core/helpers/spacing.dart';
import 'package:doc/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';

class MyTimeLineHome extends StatelessWidget {
  final Function(DateTime) onDateChange;

  const MyTimeLineHome({super.key, required this.onDateChange});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          verticalSpace(32),
          _changeDayStructureExample(),
          verticalSpace(32),
        ],
      ),
    );
  }

  EasyDateTimeLine _changeDayStructureExample() {
    return EasyDateTimeLine(
      initialDate: DateTime.now(),
      onDateChange: (selectedDate) {
        onDateChange(selectedDate);
      },
      activeColor: ColorsManager.mainBlue,
      headerProps: const EasyHeaderProps(
        dateFormatter: DateFormatter.monthOnly(),
      ),
      dayProps: const EasyDayProps(
        height: 56.0,
        width: 56.0,
        dayStructure: DayStructure.dayNumDayStr,
        inactiveDayStyle: DayStyle(
          borderRadius: 48.0,
          dayNumStyle: TextStyle(
            fontSize: 18.0,
            color: Colors.black,
          ),
          dayStrStyle: TextStyle(
            fontSize: 12.0,
            color: Colors.black,
          ),
        ),
        activeDayStyle: DayStyle(
          dayNumStyle: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          dayStrStyle: TextStyle(
            fontSize: 12.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
