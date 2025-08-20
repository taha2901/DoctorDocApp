import 'package:doc/core/theming/colors.dart';
import 'package:doc/features/checkout_payment/views/widgets/payment_methods_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// class AppointmentNavigationButtons extends StatelessWidget {
//   final bool isLoading;
//   final int currentStep;
//   final int totalSteps;
//   final VoidCallback? onBack;
//   final VoidCallback onContinue;
//   final double totalAmount; // المبلغ اللي هيدفع

//   const AppointmentNavigationButtons({
//     Key? key,
//     required this.isLoading,
//     required this.currentStep,
//     required this.totalSteps,
//     required this.onContinue,
//     this.onBack,
//     required this.totalAmount,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(20),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           if (currentStep > 0)
//             Expanded(
//               child: Container(
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(15),
//                   border: Border.all(color: ColorsManager.mainBlue),
//                 ),
//                 height: 45.h,
//                 margin: const EdgeInsets.only(right: 10),
//                 child: TextButton(
//                   onPressed: isLoading ? null : onBack,
//                   child: const Text(
//                     'Back',
//                     style: TextStyle(color: ColorsManager.mainBlue),
//                   ),
//                 ),
//               ),
//             ),
//           Expanded(
//             child: Container(
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(15),
//                 color: ColorsManager.mainBlue,
//               ),
//               height: 45.h,
//               child: TextButton(
//                 onPressed: isLoading
//                     ? null
//                     : () {
//                         if (currentStep < totalSteps - 1) {
//                           // لسه مش آخر خطوة → كمل عادي
//                           onContinue();
//                         } else {
//                           // آخر خطوة → افتح الدفع
//                           // showModalBottomSheet(
//                           //   context: context,
//                           //   isScrollControlled: true,
//                           //   backgroundColor: Colors.transparent,
//                           //   builder: (context) {
//                           //     return PaymentMethodsBottomSheet(total: totalAmount);
//                           //   },
//                           // );

//                           showModalBottomSheet(
//                             context: context,
//                             builder: (_) {
//                               return PaymentMethodsBottomSheet(
//                                 total: total,
//                                 doctorId: selectedDoctor.id!,
//                                 startTime: selectedStartTime,
//                               );
//                             },
//                           );
//                         }
//                       },
//                 child: isLoading
//                     ? const SizedBox(
//                         width: 20,
//                         height: 20,
//                         child: CircularProgressIndicator(
//                           color: Colors.white,
//                           strokeWidth: 2,
//                         ),
//                       )
//                     : Text(
//                         currentStep < totalSteps - 1 ? 'Continue' : 'Confirm',
//                         style: const TextStyle(color: Colors.white),
//                       ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }



class AppointmentNavigationButtons extends StatelessWidget {
  final bool isLoading;
  final int currentStep;
  final int totalSteps;
  final VoidCallback? onBack;
  final VoidCallback onContinue;
  final double totalAmount; // المبلغ اللي هيدفع
  final int doctorId; // id الدكتور
  final String startTime; // وقت الحجز

  const AppointmentNavigationButtons({
    Key? key,
    required this.isLoading,
    required this.currentStep,
    required this.totalSteps,
    required this.onContinue,
    this.onBack,
    required this.totalAmount,
    required this.doctorId,
    required this.startTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (currentStep > 0)
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: ColorsManager.mainBlue),
                ),
                height: 45.h,
                margin: const EdgeInsets.only(right: 10),
                child: TextButton(
                  onPressed: isLoading ? null : onBack,
                  child: const Text(
                    'Back',
                    style: TextStyle(color: ColorsManager.mainBlue),
                  ),
                ),
              ),
            ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: ColorsManager.mainBlue,
              ),
              height: 45.h,
              child: TextButton(
                onPressed: isLoading
                    ? null
                    : () {
                        if (currentStep < totalSteps - 1) {
                          onContinue();
                        } else {
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            builder: (_) {
                              return PaymentMethodsBottomSheet(
                                total: totalAmount,
                                doctorId: doctorId,
                                startTime: startTime,
                              );
                            },
                          );
                        }
                      },
                child: isLoading
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 2,
                        ),
                      )
                    : Text(
                        currentStep < totalSteps - 1 ? 'Continue' : 'Confirm',
                        style: const TextStyle(color: Colors.white),
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
