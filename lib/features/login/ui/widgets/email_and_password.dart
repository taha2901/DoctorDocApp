import 'package:doc/core/helpers/app_regex.dart';
import 'package:doc/core/helpers/spacing.dart';
import 'package:doc/core/widgets/app_text_form_field.dart';
import 'package:doc/features/login/logic/cubit/login_cubit.dart';
import 'package:doc/features/login/ui/widgets/password_validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmailAndPassword extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  const EmailAndPassword({super.key, required this.formKey});

  @override
  State<EmailAndPassword> createState() => _EmailAndPasswordState();
}

class _EmailAndPasswordState extends State<EmailAndPassword> {
  bool isObscureText = true;

  late TextEditingController passwordController;
  bool hasValidated = false;
  bool hasLowerCase = false;
  bool hasUpperCase = false;
  bool hasNumber = false;
  bool hasSpecialChar = false;
  bool hasLength = false;

  VoidCallback? _passwordListener;

  @override
  void initState() {
    super.initState();
    passwordController = context.read<LoginCubit>().passwordController;
    setUpPasswordControllerListener();
  }

  void setUpPasswordControllerListener() {
    _passwordListener = () {
      if (!mounted) return; // تأكد إن الودجت لسه في الشجرة
      setState(() {
        hasLowerCase = AppRegex.hasLowerCase(passwordController.text);
        hasUpperCase = AppRegex.hasUpperCase(passwordController.text);
        hasNumber = AppRegex.hasNumber(passwordController.text);
        hasSpecialChar = AppRegex.hasSpecialCharacter(passwordController.text);
        hasLength = AppRegex.hasMinLength(passwordController.text);
      });
    };
    passwordController.addListener(_passwordListener!);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: widget.formKey,
        child: Column(
          children: [
            AppTextFormField(
              hintText: 'Email',
              controller: context.read<LoginCubit>().emailController,
              validator: (value) {
                if (value == null ||
                    value.isEmpty ||
                    !AppRegex.isEmailValid(value)) {
                  return 'Please enter your email';
                }
                return null;
              },
            ),
            verticalSpace(18),
            AppTextFormField(
              controller: context.read<LoginCubit>().passwordController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password';
                }
                return null;
              },
              hintText: 'Password',
              isObscureText: isObscureText,
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    isObscureText = !isObscureText;
                  });
                },
                icon: Icon(
                    isObscureText ? Icons.visibility : Icons.visibility_off),
              ),
            ),
            verticalSpace(24),
            PasswordValidation(
              hasLowerCase: hasLowerCase,
              hasUpperCase: hasUpperCase,
              hasNumber: hasNumber,
              hasSpecialCharacter: hasSpecialChar,
              hasMinLength: hasLength,
            ),
          ],
        ));
  }

  @override
  void dispose() {
    if (_passwordListener != null) {
      passwordController.removeListener(_passwordListener!);
    }
    super.dispose();
  }
}
