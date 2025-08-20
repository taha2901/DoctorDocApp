import 'package:doc/features/book_appoint/data/model/appointment_response_body.dart';

abstract class AppointmentState {}

class AppointmentInitial extends AppointmentState {}

class AppointmentLoading extends AppointmentState {}

class AppointmentSuccess extends AppointmentState {
  final AppointmentResponsebody response;

  AppointmentSuccess(this.response);
}

class AppointmentError extends AppointmentState {
  final String error;

  AppointmentError(this.error);
}