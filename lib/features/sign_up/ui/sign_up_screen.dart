import 'package:doc/core/di/dependency_injection.dart';
import 'package:doc/features/sign_up/logic/cubit/sign_up_cubit.dart';
import 'package:doc/features/sign_up/ui/widget/already_have_account_text.dart';
import 'package:doc/features/sign_up/ui/widget/sign_up_bloc_listener.dart';
import 'package:doc/features/sign_up/ui/widget/sign_up_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/helpers/spacing.dart';
import '../../../core/theming/styles.dart';
import '../../../core/widgets/app_text_button.dart';
import '../../login/ui/widgets/terms_and_conditions_text.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getit<SignupCubit>(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            body: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 8.h),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Create Account',
                        style: TextStyles.font24BlueBold,
                      ),
                      verticalSpace(8),
                      Text(
                        'Sign up now and start exploring all that our app has to offer. We\'re excited to welcome you to our community!',
                        style: TextStyles.font14GrayRegular,
                      ),
                      verticalSpace(18),
                      Column(
                        children: [
                          const SignupForm(),
                          verticalSpace(24),
                          AppTextButton(
                            buttonText: "Create Account",
                            textStyle: TextStyles.font16WhiteSemiBold,
                            onPressed: () {
                              validateThenDoSignup(context);
                            },
                          ),
                          verticalSpace(8),
                          const TermsAndConditionsText(),
                          verticalSpace(18),
                          const AlreadyHaveAccountText(),
                          const SignupBlocListener(),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }
      ),
    );
  }

  void validateThenDoSignup(BuildContext context) {
    if (context.read<SignupCubit>().formKey.currentState!.validate()) {
      context.read<SignupCubit>().emitSignupStates();
    }
  }
}
