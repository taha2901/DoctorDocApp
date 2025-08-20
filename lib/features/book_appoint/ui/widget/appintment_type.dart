import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum AppointmentType { inPerson, videoCall, phoneCall }

class AppointmentTypeSelector extends StatefulWidget {
  final Function(String) onTypeSelected;

  const AppointmentTypeSelector({
    super.key,
    required this.onTypeSelected,
  });

  @override
  State<AppointmentTypeSelector> createState() =>
      _AppointmentTypeSelectorState();
}

class _AppointmentTypeSelectorState extends State<AppointmentTypeSelector> {
  AppointmentType? _selectedAppointmentType = AppointmentType.inPerson;

  final List<Map<String, dynamic>> appointmentOptions = [
    {
      'type': AppointmentType.inPerson,
      'icon': Icons.person_rounded,
      'color': Colors.blue,
      'label': 'In Person',
      'subtitle': 'Meet at clinic',
    },
    {
      'type': AppointmentType.videoCall,
      'icon': Icons.videocam_rounded,
      'color': Colors.green,
      'label': 'Video Call',
      'subtitle': 'Online consultation',
    },
    {
      'type': AppointmentType.phoneCall,
      'icon': Icons.phone_rounded,
      'color': Colors.orange,
      'label': 'Phone Call',
      'subtitle': 'Voice consultation',
    },
  ];

  @override
  void initState() {
    super.initState();
    widget.onTypeSelected(_enumToString(_selectedAppointmentType!));
  }

  String _enumToString(AppointmentType type) {
    return type.toString().split('.').last;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.w),
      child: Column(
        children: appointmentOptions.map((option) {
          final isSelected = _selectedAppointmentType == option['type'];
          
          return Container(
            margin: EdgeInsets.only(bottom: 12.h),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _selectedAppointmentType = option['type'];
                  widget.onTypeSelected(_enumToString(option['type']));
                });
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16.r),
                  border: Border.all(
                    color: isSelected
                        ? Theme.of(context).primaryColor
                        : Colors.grey.shade200,
                    width: isSelected ? 2 : 1,
                  ),
                  boxShadow: isSelected
                      ? [
                          BoxShadow(
                            color: Theme.of(context).primaryColor.withOpacity(0.1),
                            blurRadius: 8,
                            offset: const Offset(0, 3),
                          ),
                        ]
                      : [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.05),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                ),
                child: Row(
                  children: [
                    Container(
                      width: 56.w,
                      height: 56.h,
                      decoration: BoxDecoration(
                        color: (option['color'] as Color).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      child: Icon(
                        option['icon'],
                        color: option['color'],
                        size: 24.sp,
                      ),
                    ),
                    SizedBox(width: 16.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            option['label'],
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey[800],
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            option['subtitle'],
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ),
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      width: 24.w,
                      height: 24.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: isSelected
                            ? Theme.of(context).primaryColor
                            : Colors.transparent,
                        border: Border.all(
                          color: isSelected
                              ? Theme.of(context).primaryColor
                              : Colors.grey[400]!,
                          width: 2,
                        ),
                      ),
                      child: isSelected
                          ? Icon(
                              Icons.check_rounded,
                              size: 14.sp,
                              color: Colors.white,
                            )
                          : null,
                    ),
                  ],
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}