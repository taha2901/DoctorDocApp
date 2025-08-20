import 'package:doc/core/helpers/spacing.dart';
import 'package:doc/core/theming/colors.dart';
import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notification'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  children: [
                    const Text(
                      'Today',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    Container(
                      decoration: BoxDecoration(
                        color:  ColorsManager.mainBlue,
                        borderRadius: BorderRadius.circular(16)
                      ),
                      child: TextButton(
                        onPressed: () {
                        },
                        child: const Text(
                          'Mark all as read',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              verticalSpace(16),

              // Appointment Success Notification
              _buildNotificationCard(
                title: 'Appointment Success',
                description: "Congratulations - your appointment is confirmed! "
                    "We're looking forward to meeting with you and helping you "
                    "achieve your goals.",
                icon: Icons.check_circle,
                iconColor: Colors.green,
              ),

              // Schedule Changed Notification
              _buildNotificationCard(
                title: 'Schedule Changed',
                description:
                    "You have successfully changed your appointment with "
                    "Dr. Randy Wigham. Don't forget to active your reminder.",
                icon: Icons.schedule,
                iconColor: Colors.blue,
              ),

              // Video Call Appointment Notification
              _buildNotificationCard(
                title: 'Video Call Appointment',
                description: "We'll send you a link to join the call at the "
                    "booking details, so all you need is a computer or mobile "
                    "device with a camera and an Internet connection.",
                icon: Icons.video_call,
                iconColor: Colors.purple,
              ),

              // Appointment Cancelled Notification
              _buildNotificationCard(
                title: 'Appointment Cancelled',
                description:
                    "You have successfully canceled your appointment with "
                    "Dr. Randy Wigham. 50% of the funds will be returned to "
                    "your account.",
                icon: Icons.cancel,
                iconColor: Colors.red,
              ),

              // New Payment Added Notification
              _buildNotificationCard(
                title: 'New Payment Added!',
                description:
                    "Your payment has been successfully linked with Doodoo.",
                icon: Icons.payment,
                iconColor: Colors.green,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNotificationCard({
    required String title,
    required String description,
    required IconData icon,
    required Color iconColor,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, size: 32, color: iconColor),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    description,
                    style: const TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
