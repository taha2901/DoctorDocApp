import 'package:doc/core/helpers/constants.dart';
import 'package:doc/core/helpers/shared_pref_helper.dart';
import 'package:doc/core/networking/api_error_handler.dart';
import 'package:doc/core/networking/api_result.dart';
import 'package:doc/features/sign_up/data/models/sign_up_request_body.dart';
import 'package:doc/features/sign_up/data/models/sign_up_response.dart';
import 'package:doc/features/sign_up/data/repo/sign_up_repo.dart';
import 'package:doc/features/sign_up/logic/cubit/sign_up_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupCubit extends Cubit<SignupState<SignupResponseBody>> {
  final SignupRepo _signupRepo;
  SignupCubit(this._signupRepo) : super(const SignupState.initial());

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController =
      TextEditingController();

  final GlobalKey<FormState> formKey =
      GlobalKey<FormState>(debugLabel: 'signup_form');

  Future<void> emitSignupStates() async {
    emit(const SignupState.signupLoading());

    final result = await _signupRepo.signup(
      SignupRequestBody(
        name: nameController.text,
        email: emailController.text,
        phone: phoneController.text,
        password: passwordController.text,
        passwordConfirmation: passwordConfirmationController.text,
        gender: 0,
      ),
    );

    if (isClosed) return;

    if (result is ApiSuccess<SignupResponseBody>) {
      final signupResponse = result.data;

      await SharedPrefHelper.setSecuredString(
        SharedPrefKeys.userName,
        signupResponse.userData?.userName ?? '',
      );

      if (isClosed) return;
      emit(SignupState.signupSuccess(signupResponse));
      return;
    }

    if (result is ApiFailure<SignupResponseBody>) {
      emit(SignupState.signupError(
        error: result.errorHandler.apiErrorModel.message ?? '',
      ));
      return;
    }

    emit(SignupState.signupError(
      error: ErrorHandler.handle("Unexpected error").apiErrorModel.message ?? '',
    ));
  }
}
