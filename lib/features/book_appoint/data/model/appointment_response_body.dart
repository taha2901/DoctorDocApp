import 'package:doc/features/my_appointment/data/model/all_appointment_response_body/doctor.dart';
import 'package:doc/features/my_appointment/data/model/all_appointment_response_body/patient.dart';

class AppointmentResponsebody {
  final int id;
  final Doctor doctor;
  final Patient patient;
  final String appointmentTime;
  final String appointmentEndTime;
  final bool status;
  final String notes;
  final int appointmentPrice;

  AppointmentResponsebody({
    required this.id,
    required this.doctor,
    required this.patient,
    required this.appointmentTime,
    required this.appointmentEndTime,
    required this.status,
    required this.notes,
    required this.appointmentPrice,
  });

  factory AppointmentResponsebody.fromJson(Map<String, dynamic> json) {
    return AppointmentResponsebody(
      id: json['id'] ?? 0,
      doctor: Doctor.fromJson(json['doctor'] ?? {}),
      patient: Patient.fromJson(json['patient'] ?? {}),
      appointmentTime: json['appointment_time'] ?? '',
      appointmentEndTime: json['appointment_end_time'] ?? '',
      status: json['status'] ?? 'pending',
      notes: json['notes'] ?? '',
      appointmentPrice: json['appointment_price'] ?? 0,
    );
  }
}