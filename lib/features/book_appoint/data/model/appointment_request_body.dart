// appointment_request_model.dart
class AppointmentRequestBody {
  final int doctorId;
  final String startTime; // Format: "YYYY-MM-DD HH:MM"

  AppointmentRequestBody({
    required this.doctorId,
    required this.startTime,
  });

  Map<String, dynamic> toJson() => {
        'doctor_id': doctorId,
        'start_time': startTime,
      };
}