import 'package:doc/core/helpers/spacing.dart';
import 'package:doc/features/my_appointment/data/model/all_appointment_response_body/datum.dart';
import 'package:doc/features/my_appointment/logic/all_appointments_cubit.dart';
import 'package:doc/features/my_appointment/logic/all_appointments_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class MyAppointmentScreen extends StatelessWidget {
  const MyAppointmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          foregroundColor: Colors.black,
          title: const Text("My Appointment"),
          centerTitle: true,
          leading: const BackButton(),
          actions: [
            IconButton(icon: const Icon(Icons.search), onPressed: () {})
          ],
          bottom: const TabBar(
            labelColor: Colors.blue,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.blue,
            tabs: [
              Tab(text: "Upcoming"),
              Tab(text: "Completed"),
              Tab(text: "Cancelled"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // Upcoming Appointments
            _buildUpcomingAppointments(),
            const Center(child: Text("No completed appointments")),
            const Center(child: Text("No cancelled appointments")),
          ],
        ),
      ),
    );
  }
  

  Widget _buildUpcomingAppointments() {
    return BlocConsumer<AllAppointmentCubit, AllAppointmentsState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is AllAppointmentLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is AllAppointmentSuccess) {
          final appointments = context
                  .read<AllAppointmentCubit>()
                  .allAppointmentResponseBody
                  ?.data ??
              [];

          if (appointments.isEmpty) {
            return const Center(child: Text("No upcoming appointments"));
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: appointments.length,
            itemBuilder: (context, index) {
              final appointment = appointments[index];
              return _AppointmentCard(appointment: appointment);
            },
          );
        } else if (state is AllAppointmentError) {
          return Center(child: Text("Error: ${state.apiErrorModel.message}"));
        }
        return const Center(child: Text("No appointments found"));
      },
    );
  }
}

class _AppointmentCard extends StatelessWidget {
  final AppointmentData appointment;

  const _AppointmentCard({required this.appointment});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue.shade100, width: 1),
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  "assets/images/Image.png",
                  width: 80.w,
                  height: 80.h,
                  fit: BoxFit.cover,
                ),
              ),
              horizontalSpace(12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      appointment.doctor?.name ?? "No name",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      "General Medical Checkup",
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      _formatAppointmentTime(appointment.appointmentTime),
                      style: const TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                  ],
                ),
              ),
              const Icon(Iconsax.message, color: Colors.blue),
            ],
          ),
          Divider(height: 20.h),
          Row(
            children: [
              OutlinedButton(
                onPressed: () {},
                child: const Text("Cancel Appointment"),
              ),
              horizontalSpace(8),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                  child: const Text(
                    "Reschedule",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  String _formatAppointmentTime(String? dateTime) {
    if (dateTime == null) return "No time scheduled";
    
    try {
      final DateTime parsedDate = DateTime.parse(dateTime);
      return "${_getWeekday(parsedDate.weekday)}, ${parsedDate.day} ${_getMonth(parsedDate.month)} | ${_formatTime(parsedDate)}";
    } catch (e) {
      return dateTime; // Return original if parsing fails
    }
  }

  String _getWeekday(int weekday) {
    const days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    return days[weekday - 1];
  }

  String _getMonth(int month) {
    const months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
    ];
    return months[month - 1];
  }

  String _formatTime(DateTime time) {
    final hour = time.hour % 12;
    final period = time.hour < 12 ? 'AM' : 'PM';
    return '${hour == 0 ? 12 : hour}:${time.minute.toString().padLeft(2, '0')} $period';
  }
}