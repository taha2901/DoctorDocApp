import 'package:doc/core/routings/routers.dart';
import 'package:doc/features/book_appoint/logic/appointment_cubit.dart';
import 'package:doc/features/book_appoint/logic/appointment_states.dart';
import 'package:doc/features/book_appoint/ui/widget/book_info/book_info_screen.dart';
import 'package:doc/features/book_appoint/ui/widget/payment_step/appointment_navigation_buttons.dart';
import 'package:doc/features/book_appoint/ui/widget/payment_step/appointment_succes_dialoge.dart';
import 'package:doc/features/book_appoint/ui/widget/payment_step/dateTime_step_content.dart';
import 'package:doc/features/book_appoint/ui/widget/payment_step/stepper_header.dart';
import 'package:doc/features/checkout_payment/views/widgets/payment_methods_bottom_sheet.dart';
import 'package:doc/features/home/data/models/specializations_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class BookAppointScreen extends StatefulWidget {
  final Doctors doctorId;
  final Doctors doctorName;

  const BookAppointScreen(
      {super.key, required this.doctorId, required this.doctorName});

  @override
  _BookAppointScreenState createState() => _BookAppointScreenState();
}

class _BookAppointScreenState extends State<BookAppointScreen> {
  int _currentStep = 0;
  DateTime? selectedDate;
  String selectedTime = '';
  String selectedAppointmentType = 'In-person';

  // تم تقليل الخطوات لتصبح خطوتين فقط
  final List<Map<String, dynamic>> steps = [
    {'title': 'Date & Time'},
    {'title': 'Summary'},
  ];

  void _handleTypeSelected(String type) {
    if (mounted) {
      selectedAppointmentType = type;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) setState(() {});
      });
    }
  }

  void _handleTimeSelected(String time) {
    if (mounted) {
      selectedTime = time;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) setState(() {});
      });
    }
  }

  void _handleDateChange(DateTime date) {
    if (mounted) {
      selectedDate = date;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) setState(() {});
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppointmentCubit, AppointmentState>(
      listener: (context, state) {
        if (state is AppointmentSuccess) {
          debugPrint('Appointment Success State: ${state.response.toString()}');

          WidgetsBinding.instance.addPostFrameCallback((_) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) =>
                  AppointmentSuccessDialog(response: state.response),
            ).then((_) {
              Navigator.pushNamed(context, Routers.bottomNavigation);
            });
          });
        } else if (state is AppointmentError) {
          debugPrint('Appointment Error State: ${state.error}');
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.error)),
          );
        }
      },
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: const Text('Book Appointment'),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => Navigator.pop(context),
              ),
            ),
            body: Column(
              children: [
                AppointmentStepperHeader(
                  currentStep: _currentStep,
                  steps: steps,
                ),
                Expanded(
                  child: _buildStepContent(),
                ),
                AppointmentNavigationButtons(
                  doctorId: widget.doctorId.id!.toInt(),
                  startTime: selectedDate != null
                      ? DateFormat('yyyy-MM-dd').format(selectedDate!) +
                          ' ' +
                          selectedTime
                      : '',
                  totalAmount: 100,
                  isLoading: state is AppointmentLoading,
                  currentStep: _currentStep,
                  totalSteps: steps.length,
                  onBack: () {
                    setState(() {
                      _currentStep--;
                    });
                  },
                  onContinue: _handleContinuePressed,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildStepContent() {
    switch (_currentStep) {
      case 0:
        return DateTimeStepContent(
          onDateChange: _handleDateChange,
          onTimeSelected: _handleTimeSelected,
          onTypeSelected: _handleTypeSelected,
        );
      case 1:
        return _buildSummaryStep();
      default:
        return Container();
    }
  }

  Widget _buildSummaryStep() {
    return BookingInformationScreen(
      selectedDate: selectedDate,
      selectedTime: selectedTime,
      selectedType: selectedAppointmentType,
      selectedPayment: null, // لم نعد نحتاج payment method هنا
      doctorName: widget.doctorName.name,
    );
  }

  void _handleContinuePressed() {
    if (_currentStep < steps.length - 1) {
      if (_currentStep == 0 && (selectedDate == null || selectedTime.isEmpty)) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please select date and time')),
        );
        return;
      }
      setState(() {
        _currentStep++;
      });
    } else {
      // هنا لما يضغط Confirm في الخطوة الأخيرة
      // هيتم فتح payment bottom sheet مباشرة
      _showPaymentOptions();
    }
  }

  void _showPaymentOptions() {
    if (selectedDate == null || selectedTime.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select date and time')),
      );
      return;
    }

    final formattedDate = DateFormat('yyyy-MM-dd').format(selectedDate!);
    final timeParts = selectedTime.split(' ');
    final timeValue = timeParts[0].replaceAll('.', ':');
    final period = timeParts.length > 1 ? timeParts[1] : '';
    final formattedTime = '$timeValue $period';
    final startTime = '$formattedDate $formattedTime';

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) => PaymentMethodsBottomSheet(
        total: 100.0,
        doctorId: widget.doctorId.id!.toInt(),
        startTime: startTime,
      ),
    );
  }
}