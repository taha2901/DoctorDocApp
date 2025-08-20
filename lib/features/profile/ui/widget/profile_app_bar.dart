
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileAppBar extends StatelessWidget {
  const ProfileAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(

      padding:
          EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 16.h),
      child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(Icons.arrow_back_ios, color: Colors.black),
            Text('Profile',
                style:
                    TextStyle(color: Colors.black, fontSize: 20)),
            Icon(Icons.settings, color: Colors.black),
          ]),
    );
  }
}
