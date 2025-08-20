import 'package:doc/core/helpers/spacing.dart';
import 'package:doc/features/see_all_doctor/logic/see_all_doctors_specialization_cubit.dart';
import 'package:doc/features/see_all_doctor/logic/see_all_doctors_specialization_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:doc/core/theming/colors.dart';
import 'package:flutter/material.dart';


class DoctorSpecialtiesScreen extends StatelessWidget {
  const DoctorSpecialtiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Doctor Specialties',
            style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        elevation: 0,
      ),
      body: BlocBuilder<SeeAllDoctorsSpecializationCubit, SeeAllDoctorsState>(
        builder: (context, state) {
          if (state is SeeAllDoctorsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is SeeAllDoctorsSuccess) {
            final specializations = context
                    .read<SeeAllDoctorsSpecializationCubit>()
                    .doctorSpecializationsResponse
                    ?.data ??
                [];

            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 16.0,
                  mainAxisSpacing: 16.0,
                  childAspectRatio: 0.9,
                ),
                itemCount: specializations.length,
                itemBuilder: (context, index) {
                  final specialization = specializations[index];
                  return SpecialtyCard(
                    specialty: specialization.name ?? 'N/A',
                    icon: _getIconForSpecialty(specialization.name),
                    color: _getColorForSpecialty(specialization.name),
                  );
                },
              ),
            );
          } else if (state is SeeAllDoctorsError) {
            return Center(child: Text('Error: ${state.apiErrorModel.message}'));
          }

          return const SizedBox();
        },
      ),
    );
  }

  // Helper function for assigning icons
  IconData _getIconForSpecialty(String? name) {
    switch (name) {
      case 'general':
        return FontAwesomeIcons.stethoscope;
      case 'Dermatology':
        return Icons.hearing;
      case 'Neurology':
        return Icons.child_care;
      case 'Orthopedics':
        return Icons.male;
      case 'Pediatrics':
        return FontAwesomeIcons.tooth;
      case 'Gynecology':
        return Icons.air;
      case 'Ophthalmology':
        return Icons.biotech;
      case 'Urology':
        return Icons.health_and_safety;
      case 'Gastroenterology':
        return Icons.favorite;
      case 'Cardiology':
        return Icons.psychology;
      case 'pulmonary':
        return Icons.air;
      case 'Psychiatry':
        return Icons.remove_red_eye;
      default:
        return Icons.local_hospital;
    }
  }

  // Helper function for assigning colors
  Color _getColorForSpecialty(String? name) {
    switch (name) {
      case 'general':
        return Colors.blue;
      case 'Dermatology':
        return Colors.green;
      case 'Neurology':
        return Colors.orange;
      case 'Orthopedics':
        return Colors.purple;
      case 'Pediatrics':
        return Colors.teal;
      case 'Urology':
        return Colors.brown;
      case 'Ophthalmology':
        return Colors.indigo;
      case 'Gynecology':
        return Colors.lightGreen;
      case 'Psychiatry':
        return Colors.red;
      case 'Gastroenterology':
        return Colors.deepPurple;
      case 'Cardiology':
        return Colors.lightBlue;
      default:
        return Colors.grey;
    }
  }
}

class SpecialtyCard extends StatelessWidget {
  final String specialty;
  final IconData icon;
  final Color color;

  const SpecialtyCard({
    super.key,
    required this.specialty,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              color: ColorsManager.lighterGrey,
              borderRadius: BorderRadius.circular(66)),
          child: InkWell(
            onTap: () {
              debugPrint('Selected: $specialty');
            },
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Icon(icon, size: 45, color: color),
            ),
          ),
        ),
        verticalSpace(12),
        Text(
          specialty,
          textAlign: TextAlign.center,
          style:  TextStyle(
            fontSize: 11.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
