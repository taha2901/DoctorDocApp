import 'package:doc/core/helpers/spacing.dart';
import 'package:doc/core/theming/colors.dart';
import 'package:doc/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class BookingInformationScreen extends StatelessWidget {
  final DateTime? selectedDate;
  final String? doctorName;
  final String? selectedTime;
  final String? selectedType;
  final String? selectedPayment; // مش هنستخدمه دلوقتي
  
  const BookingInformationScreen({
    super.key,
    this.selectedDate,
    this.selectedTime,
    this.selectedType,
    this.selectedPayment,
    this.doctorName,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Booking Summary',
              style: TextStyles.font16BlackBold,
            ),
            verticalSpace(20),

            // Date & Time Section
            _buildInfoCard(
              icon: Icons.calendar_today_rounded,
              iconColor: ColorsManager.mainBlue,
              iconBgColor: ColorsManager.lightBlue,
              title: 'Date & Time',
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.date_range_rounded,
                        size: 16.sp,
                        color: Colors.grey[600],
                      ),
                      SizedBox(width: 6.w),
                      Text(
                        selectedDate != null 
                            ? DateFormat('EEEE, dd MMM yyyy').format(selectedDate!)
                            : 'No date selected',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey[700],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    children: [
                      Icon(
                        Icons.access_time_rounded,
                        size: 16.sp,
                        color: Colors.grey[600],
                      ),
                      SizedBox(width: 6.w),
                      Text(
                        selectedTime ?? 'No time selected',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey[700],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            verticalSpace(16),

            // Appointment Type Section
            _buildInfoCard(
              icon: Icons.medical_services_rounded,
              iconColor: ColorsManager.lightGreen,
              iconBgColor: ColorsManager.lighterGreen,
              title: 'Appointment Type',
              content: Row(
                children: [
                  Icon(
                    _getAppointmentIcon(selectedType ?? 'In-person'),
                    size: 16.sp,
                    color: Colors.grey[600],
                  ),
                  SizedBox(width: 6.w),
                  Text(
                    selectedType ?? 'In-person',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[700],
                    ),
                  ),
                ],
              ),
            ),

            verticalSpace(16),

            // Doctor Information Section
            _buildInfoCard(
              icon: Icons.person_rounded,
              iconColor: Colors.purple,
              iconBgColor: Colors.purple.shade50,
              title: 'Doctor Information',
              content: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12.r),
                    child: Image.asset(
                      'assets/images/Image.png',
                      height: 60.h,
                      width: 60.w,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          height: 60.h,
                          width: 60.w,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: Icon(
                            Icons.person,
                            size: 30.sp,
                            color: Colors.grey[600],
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          doctorName ?? 'Dr. Taha Hamada',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey[800],
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          'General | RSUD Gatot Subroto',
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.grey[600],
                          ),
                        ),
                        SizedBox(height: 6.h),
                        Row(
                          children: [
                            Icon(
                              Icons.star_rounded,
                              size: 16.sp,
                              color: Colors.amber,
                            ),
                            SizedBox(width: 4.w),
                            Text(
                              '4.8 (4.279 reviews)',
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            verticalSpace(16),

            // Fee Information
            _buildInfoCard(
              icon: Icons.account_balance_wallet_rounded,
              iconColor: Colors.green,
              iconBgColor: Colors.green.shade50,
              title: 'Consultation Fee',
              content: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total Amount',
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.grey[600],
                    ),
                  ),
                  Text(
                    '\$100.00',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ],
              ),
            ),

            verticalSpace(24),

            // Note
            Container(
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(
                  color: Colors.blue.shade200,
                  width: 1,
                ),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.info_rounded,
                    color: Colors.blue,
                    size: 20.sp,
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: Text(
                      'Payment will be processed after clicking "Confirm Appointment"',
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: Colors.blue.shade700,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard({
    required IconData icon,
    required Color iconColor,
    required Color iconBgColor,
    required String title,
    required Widget content,
  }) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: Colors.grey.shade200,
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.05),
            spreadRadius: 0,
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(10.w),
                decoration: BoxDecoration(
                  color: iconBgColor,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Icon(
                  icon,
                  color: iconColor,
                  size: 20.sp,
                ),
              ),
              SizedBox(width: 12.w),
              Text(
                title,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey[800],
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Padding(
            padding: EdgeInsets.only(left: 42.w),
            child: content,
          ),
        ],
      ),
    );
  }

  IconData _getAppointmentIcon(String type) {
    switch (type.toLowerCase()) {
      case 'in-person':
      case 'inperson':
        return Icons.person_rounded;
      case 'video call':
      case 'videocall':
        return Icons.videocam_rounded;
      case 'phone call':
      case 'phonecall':
        return Icons.phone_rounded;
      default:
        return Icons.person_rounded;
    }
  }
}