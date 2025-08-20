import 'package:doc/core/helpers/spacing.dart';
import 'package:doc/core/theming/styles.dart';
import 'package:doc/core/widgets/app_text_button.dart';
import 'package:doc/features/login/logic/cubit/login_cubit.dart';
import 'package:doc/features/login/ui/widgets/dont_have_account_text.dart';
import 'package:doc/features/login/ui/widgets/email_and_password.dart';
import 'package:doc/features/login/ui/widgets/login_bloc_listenter.dart';
import 'package:doc/features/login/ui/widgets/terms_and_conditions_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome Back',
                  style: TextStyles.font24BlueBold,
                ),
                verticalSpace(8),
                Text(
                  'We\'re excited to have you back, can\'t wait to see what you\'ve been up to since you last logged in.',
                  style: TextStyles.font14greyRegular,
                ),
                verticalSpace(36),
                Column(
                  children: [
                     EmailAndPassword(
                      formKey:  formKey,
                     ),
                    verticalSpace(24),
                    Align(
                        alignment: AlignmentDirectional.centerEnd,
                        child: Text('Forgot Password?',
                            style: TextStyles.font13BlueRegular)),
                    verticalSpace(40),
                    AppTextButton(
                      buttonText: 'Login',
                      textStyle: TextStyles.font16WhiteSemiBold,
                      onPressed: () {
                        validateThenDoLogin(context);
                      },
                    ),
                    const TermsAndConditionsText(),
                    verticalSpace(60),
                    const DontHaveAccountText(),
                    const LoginBlocListenter(),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validateThenDoLogin(BuildContext context) {
    if (formKey.currentState!.validate()) {
      context.read<LoginCubit>().emitLoginState();
    }
  }
}
