// features/ui/signup/ui/widgets/signup_form.dart
import 'package:apiecommerse/core/helper/app_regex.dart';
import 'package:apiecommerse/core/helper/spacing.dart';
import 'package:apiecommerse/core/widgets/app_text_form_field.dart';
import 'package:apiecommerse/features/logic/signup/logic/cubit/signup_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _EmailAndPasswordState();
}

class _EmailAndPasswordState extends State<SignupForm> {
  bool hasUpperCase = false;
  bool hasLowerCase = false;
  bool hasMinimalLength = false;
  bool hasSpecialCharactares = false;
  bool hasNumberes = false;
  bool isObsecureText = true;
  bool isPasswordConfirmationObscureText = true;
  late TextEditingController passwordcontroler;
  @override
  void initState() {
    super.initState();
    passwordcontroler = context.read<SignupCubit>().passwordcontroler;
    steupPasswordControlerListner();
  }

  void steupPasswordControlerListner() {
    passwordcontroler.addListener(() {
      setState(() {
        hasLowerCase = AppRegex.hasLowerCase(passwordcontroler.text);
        hasNumberes = AppRegex.hasNumber(passwordcontroler.text);
        hasSpecialCharactares =
            AppRegex.hasSpecialCharacter(passwordcontroler.text);
        hasMinimalLength = AppRegex.hasMinLength(passwordcontroler.text);
        hasUpperCase = AppRegex.hasUpperCase(passwordcontroler.text);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: context.read<SignupCubit>().formkey,
        child: Column(
          children: [
            MyTextFormField(
              hinttext: 'Name',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a valid name';
                }
              },
              controller: context.read<SignupCubit>().nameControler,
            ),
            verticalSpace(2),
            MyTextFormField(
              hinttext: 'Phone number',
              validator: (value) {
                if (value == null ||
                    value.isEmpty ||
                    !AppRegex.isPhoneNumberValid(value)) {
                  return 'Please enter a valid phone number';
                }
              },
              controller: context.read<SignupCubit>().phonecontroler,
            ),
            verticalSpace(2),
            MyTextFormField(
              hinttext: "Email",
              validator: (value) {
                if (value == null ||
                    value.isEmpty ||
                    !AppRegex.isEmailValid(value)) {
                  return "please inter validate email";
                }
              },
              controller: context.read<SignupCubit>().emailcontroler,
            ),
            verticalSpace(2),
            MyTextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "please inter validate password";
                }
              },
              hinttext: "Password",
              isObsecure: isObsecureText,
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    isObsecureText = !isObsecureText;
                  });
                },
                child: Icon(
                    isObsecureText ? Icons.visibility_off : Icons.visibility),
              ),
              controller: context.read<SignupCubit>().passwordcontroler,
            ),
            verticalSpace(2),
            MyTextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "please inter  password configration";
                }
              },
              hinttext: "Password configration",
              isObsecure: isPasswordConfirmationObscureText,
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    isPasswordConfirmationObscureText =
                        !isPasswordConfirmationObscureText;
                  });
                },
                child: Icon(isPasswordConfirmationObscureText
                    ? Icons.visibility_off
                    : Icons.visibility),
              ),
              controller:
                  context.read<SignupCubit>().passwordConfirmationController,
            ),
            verticalSpace(3),

            // PasswordValidations(
            //   hasLowerCase: hasLowerCase,
            //   hasMinimalLength: hasMinimalLength,
            //   hasNumber: hasNumberes,
            //   hasSpetialCharactars: hasSpecialCharactares,
            //   hasUpperCase: hasUpperCase,
            // )
          ],
        ));
  }

  // @override
  // void dispose() {
  //   super.dispose();
  //   passwordcontroler.dispose();
  // }
}
