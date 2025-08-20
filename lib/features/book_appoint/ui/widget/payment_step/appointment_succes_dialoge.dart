import 'package:flutter/material.dart';
import 'package:doc/features/book_appoint/data/model/appointment_response_body.dart';

class AppointmentSuccessDialog extends StatelessWidget {
  final AppointmentResponsebody response;

  const AppointmentSuccessDialog({super.key, required this.response});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Appointment Booked!'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Appointment ID: ${response.id}'),
          const SizedBox(height: 8),
          Text('Date: ${response.appointmentTime}'),
          const SizedBox(height: 8),
          Text('Status: ${response.status}'),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.popUntil(context, (route) => route.isFirst);
          },
          child: const Text('OK'),
        ),
      ],
    );
  }
}
