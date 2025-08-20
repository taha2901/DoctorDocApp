import 'package:doc/core/theming/styles.dart';
import 'package:flutter/material.dart';

class SelectDateRowWidget extends StatelessWidget {
  const SelectDateRowWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          Text(
            'Select Date',
            style: TextStyles.font16BlackBold,
          ),
          const Spacer(),
          Text(
            'Set Manual',
            style: TextStyles.font12BlueMedium,
          ),
        ],
      ),
    );
  }
}
