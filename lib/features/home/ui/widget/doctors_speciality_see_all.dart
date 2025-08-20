import 'package:doc/core/routings/routers.dart';
import 'package:doc/core/theming/styles.dart';
import 'package:flutter/material.dart';

class DoctorsSpecialitySeeAll extends StatelessWidget {
  const DoctorsSpecialitySeeAll({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Doctors Speciality',
          style: TextStyles.font18DarkBlueSemiBold,
        ),
        const Spacer(),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, Routers.seeAllDoctor);
          },
          child: Text(
            'See All',
            style: TextStyles.font12BlueRegular,
          ),
        ),
      ],
    );
  }
}
