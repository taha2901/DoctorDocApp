import 'package:doc/core/theming/styles.dart';
import 'package:doc/features/checkout_payment/views/widgets/payment_methods_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum PaymentOption { creditCard, paypal }

class PaymentOptionSelector extends StatefulWidget {
  final Function(String) onPaymentSelected;
  final String? selectedMethod; // إضافة parameter للحالة الحالية
  
  const PaymentOptionSelector({
    super.key,
    required this.onPaymentSelected,
    this.selectedMethod,
  });

  @override
  State<PaymentOptionSelector> createState() => _PaymentOptionSelectorState();
}

class _PaymentOptionSelectorState extends State<PaymentOptionSelector> {
  PaymentOption? _selectedOption = PaymentOption.creditCard;

  @override
  void initState() {
    super.initState();
    
    // تعيين الحالة الحالية إذا تم تمريرها
    if (widget.selectedMethod != null) {
      _selectedOption = _stringToEnum(widget.selectedMethod!);
    }
    
    widget.onPaymentSelected(_enumToString(_selectedOption!));
  }

  @override
  void didUpdateWidget(PaymentOptionSelector oldWidget) {
    super.didUpdateWidget(oldWidget);
    // تحديث الحالة عند تغيير الـ widget
    if (widget.selectedMethod != oldWidget.selectedMethod && 
        widget.selectedMethod != null) {
      _selectedOption = _stringToEnum(widget.selectedMethod!);
    }
  }

  String _enumToString(PaymentOption option) {
    switch (option) {
      case PaymentOption.creditCard:
        return 'Bank Transfer';
      case PaymentOption.paypal:
        return 'Paypal';
    }
  }

  PaymentOption _stringToEnum(String value) {
    switch (value) {
      case 'Credit Card':
        return PaymentOption.creditCard;
      case 'Paypal':
        return PaymentOption.paypal;
      default:
        return PaymentOption.creditCard;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text('Payment Option', style: TextStyles.font16BlackBold),
          ),
          _buildOption(
            label: 'Credit Card',
            value: PaymentOption.creditCard,
          ),
          _buildOption(
            label: 'Paypal',
            value: PaymentOption.paypal,
          ),
        ],
      ),
    );
  }

  Widget _buildOption({required String label, required PaymentOption value}) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Radio<PaymentOption>(
        value: value,
        groupValue: _selectedOption,
        onChanged: (val) {
          setState(() {
            _selectedOption = val;
            widget.onPaymentSelected(_enumToString(val!));
          });
        },
      ),
      title: Text(label, style: const TextStyle(fontWeight: FontWeight.w500)),
      onTap: () {
        setState(() {
          _selectedOption = value;
          widget.onPaymentSelected(_enumToString(value));
        });
      },
    );
  }
}