import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:doc/core/helpers/spacing.dart';

class AppointmentStepperHeader extends StatelessWidget {
  final int currentStep;
  final List<Map<String, dynamic>> steps;

  const AppointmentStepperHeader({
    super.key,
    required this.currentStep,
    required this.steps,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(steps.length, (index) {
          return Column(
            children: [
              Container(
                width: 40.w,
                height: 40.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: currentStep >= index ? Colors.blue : Colors.grey,
                ),
                child: Center(
                  child: Text(
                    '${index + 1}',
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
              verticalSpace(5),
              Text(
                steps[index]['title'],
                style: TextStyle(
                  fontWeight: currentStep == index
                      ? FontWeight.bold
                      : FontWeight.normal,
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
