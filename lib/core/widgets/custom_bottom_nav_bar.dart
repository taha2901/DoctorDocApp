  import 'package:doc/core/di/dependency_injection.dart';
  import 'package:doc/core/theming/colors.dart';
  import 'package:doc/features/home/ui/home_screen.dart';
  import 'package:doc/features/my_appointment/logic/all_appointments_cubit.dart';
  import 'package:doc/features/my_appointment/ui/my_appointment.dart';
  import 'package:doc/features/notifications/ui/notifications_screen.dart';
  import 'package:doc/features/profile/logic/profile_cubit.dart';
  import 'package:doc/features/profile/ui/profile_screen.dart';
  import 'package:doc/features/search/logic/doctor_filter_cubit.dart';
  import 'package:doc/features/search/ui/search_screen.dart';
  import 'package:flutter/material.dart';
  import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
  import 'package:flutter_bloc/flutter_bloc.dart';
  import 'package:iconsax/iconsax.dart';

  class CustomBottomNavBar extends StatefulWidget {
    const CustomBottomNavBar({super.key});

    @override
    State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
  }

  class _CustomBottomNavBarState extends State<CustomBottomNavBar>
      with TickerProviderStateMixin {
    int _selectedIndex = 0;
    final List<IconData> _iconList = [
      Iconsax.home,
      Iconsax.message,
      Icons.card_travel,
      Iconsax.setting,
    ];

    void _onItemTapped(int index) {
      setState(() {
        _selectedIndex = index;
      });
    }

    final List<Widget> _pages = [
      const HomeScreen(),
      const NotificationsScreen(),
      BlocProvider(
        create: (context) => getit<AllAppointmentCubit>()..getAllAppointments(),
        child: const MyAppointmentScreen(),
      ),
      BlocProvider(
        create: (context) => getit<ProfileCubit>()..getProfileData(),
        child: const ProfileScreen(),
      ),
    ];

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: _pages[_selectedIndex],
        floatingActionButton: FloatingActionButton(
          backgroundColor: ColorsManager.mainBlue,
          child: const Icon(
            Icons.search,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => BlocProvider(
                        create: (context) => getit<DoctorFilterCubit>(),
                        child: const DoctorSearchScreen(),
                      )),
            );
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: AnimatedBottomNavigationBar(
          // notchAndCornersAnimation: borderRadiusAnimation,
          icons: _iconList,
          activeIndex: _selectedIndex,
          gapLocation: GapLocation.center,
          notchSmoothness: NotchSmoothness.softEdge,
          onTap: _onItemTapped,
        ),
      );
    }
  }
