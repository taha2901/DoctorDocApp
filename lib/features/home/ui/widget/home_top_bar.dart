import 'package:doc/core/helpers/constants.dart';
import 'package:doc/core/helpers/shared_pref_helper.dart';
import 'package:doc/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/theming/styles.dart';

class HomeTopBar extends StatefulWidget {
  const HomeTopBar({super.key});

  @override
  State<HomeTopBar> createState() => _HomeTopBarState();
}

class _HomeTopBarState extends State<HomeTopBar> {
  String userName = ''; //1

  @override
  void initState() {
    super.initState();
    loadUserName(); //2
  }

  Future<void> loadUserName() async { //3
    final name =
        await SharedPrefHelper.getSecuredString(SharedPrefKeys.userName);

    setState(() {
      if (name != null && name.isNotEmpty) {
        userName = name;
      } else {
        userName = 'User'; 
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hi, $userName', //4
              style: TextStyles.font18DarkBlueBold,
            ),
            Text(
              'How Are you Today?',
              style: TextStyles.font12GrayRegular,
            ),
          ],
        ),
        const Spacer(),
        CircleAvatar(
          radius: 24.0,
          backgroundColor: ColorsManager.moreLighterGray,
          child: SvgPicture.asset(
            'assets/svgs/notifications.svg',
          ),
        )
      ],
    );
  }
}
