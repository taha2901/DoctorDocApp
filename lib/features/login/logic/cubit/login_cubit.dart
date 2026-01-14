import 'package:doc/core/helpers/constants.dart';
import 'package:doc/core/helpers/shared_pref_helper.dart';
import 'package:doc/core/networking/api_error_handler.dart';
import 'package:doc/core/networking/api_result.dart';
import 'package:doc/core/networking/dio_factory.dart';
import 'package:doc/features/login/data/models/login_request_body.dart';
import 'package:doc/features/login/data/models/login_response_body.dart';
import 'package:doc/features/login/data/repos/login_repo.dart';
import 'package:doc/features/login/logic/cubit/login_state.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;
  LoginCubit(this._loginRepo) : super(const LoginState.initial());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> emitLoginState() async {
    emit(const LoginState.loading());

    final ApiResult<LoginResponseBody> result = await _loginRepo.login(
      LoginRequestBody(
        email: emailController.text,
        password: passwordController.text,
      ),
    );

    if (isClosed) return;

    if (result is ApiSuccess<LoginResponseBody>) {
      final success = result;
      final loginResponse = success.data;

      await saveUserToken(loginResponse.userData?.token ?? '');
      await SharedPrefHelper.setSecuredString(
        SharedPrefKeys.userName,
        loginResponse.userData?.userName ?? '',
      );

      if (isClosed) return;
      emit(LoginState.success(loginResponse));
      return;
    }

    if (result is ApiFailure<LoginResponseBody>) {
      final failure = result;
      emit(LoginState.error(
        error: failure.errorHandler.apiErrorModel.message ?? '',
      ));
      return;
    }

    emit(LoginState.error(
      error: ErrorHandler.handle("Unexpected error").apiErrorModel.message ?? '',
    ));
  }

  Future<void> saveUserToken(String token) async {
    await SharedPrefHelper.setSecuredString(SharedPrefKeys.userToken, token);
    DioFactory.setTokenIntoHeaderAfterLogin(token);
  }
}
