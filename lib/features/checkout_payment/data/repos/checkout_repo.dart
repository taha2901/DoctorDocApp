import 'package:dartz/dartz.dart';
import 'package:doc/core/errors/failures.dart';
import 'package:doc/features/checkout_payment/data/models/payment_intent_input_model.dart';

abstract class CheckoutRepo {
  Future<Either<Failure, void>> makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel});
}
