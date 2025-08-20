import 'package:doc/core/helpers/spacing.dart';
import 'package:doc/core/routings/routers.dart';
import 'package:doc/core/theming/colors.dart';
import 'package:doc/core/helpers/shared_pref_helper.dart';
import 'package:doc/features/profile/logic/profile_cubit.dart';
import 'package:doc/features/profile/logic/profile_state.dart';
import 'package:doc/features/profile/ui/widget/appointments_and_records_buttons.dart';
import 'package:doc/features/profile/ui/widget/profile_app_bar.dart';
import 'package:doc/features/profile/ui/widget/profile_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {
        // ✅ Handle logout success
        if (state is LogoutSuccess) {
          // Clear any stored tokens
          SharedPrefHelper.clearAllSecuredData();
    
          // Navigate to login screen and clear all previous routes
          Navigator.pushNamedAndRemoveUntil(
            context,
            Routers.login,
            (route) => false,
          );
    
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Logged out successfully!'),
              backgroundColor: Colors.green,
            ),
          );
        } else if (state is LogoutError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.apiErrorModel.message ?? 'Logout failed'),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      builder: (context, state) {
        final profileResponse =
            ProfileCubit.get(context).profileResponseModel;
        final profileData = profileResponse?.data?.first;
    
        return Scaffold(
          backgroundColor: ColorsManager.mainBlue,
          body: SafeArea(
            child: Column(
              children: [
                const ProfileAppBar(),
                verticalSpace(150),
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(30)),
                    ),
                    child: Builder(
                      builder: (_) {
                        if (state is ProfileLoading) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else if (state is ProfileError) {
                          return Center(
                              child: Text(
                                  state.apiErrorModel.message.toString()));
                        } else if (profileData == null) {
                          return const Center(
                              child: Text('No data available'));
                        }
                        return SingleChildScrollView(
                          child: Column(
                            children: [
                              verticalSpace(20),
                              const CircleAvatar(
                                radius: 45,
                                child: Icon(Icons.person),
                              ),
                              verticalSpace(10),
                              Text(
                                profileData.name ?? 'No Name',
                                style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                profileData.email ?? 'No Email',
                                style: const TextStyle(color: Colors.grey),
                              ),
                              verticalSpace(20),
                              const AppointmentAndRecordsButtons(),
                              verticalSpace(20),
                              ProfileTile(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, Routers.personalInformation);
                                },
                                icon: Icons.person_outline,
                                text: "Personal Information",
                                iconColor: Colors.blue,
                              ),
                              ProfileTile(
                                onTap: () {},
                                icon: Icons.biotech_outlined,
                                text: "My Test & Diagnostic",
                                iconColor: Colors.green,
                              ),
                              ProfileTile(
                                onTap: () {},
                                icon: Icons.payment_outlined,
                                text: "Payment",
                                iconColor: Colors.red,
                              ),
                              ProfileTile(
                                onTap: () {
                                  _showLogoutDialog(context);
                                },
                                icon: Icons.logout,
                                text: "Logout",
                                iconColor: Colors.orange,
                              ),
                              verticalSpace(20),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: const Text('Logout'),
          content: const Text('Are you sure you want to logout?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(dialogContext).pop(); // Close dialog
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                Navigator.of(dialogContext).pop(); // Close dialog

                // Direct logout without cubit
                await _performLogout(context);
              },
              child: const Text(
                'Logout',
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        );
      },
    );
  }

  // ✅ Direct logout method
  Future<void> _performLogout(BuildContext context) async {
    // Show loading
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );

    try {
      // Clear all stored data
      await SharedPrefHelper.clearAllSecuredData();
      await SharedPrefHelper.clearAllData();

      // Close loading dialog
      Navigator.of(context).pop();

      // Navigate to login screen and clear all previous routes
      Navigator.pushNamedAndRemoveUntil(
        context,
        Routers.login,
        (route) => false,
      );

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Logged out successfully!'),
          backgroundColor: Colors.green,
        ),
      );
    } catch (e) {
      // Close loading dialog
      Navigator.of(context).pop();

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Logout failed: ${e.toString()}'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}
