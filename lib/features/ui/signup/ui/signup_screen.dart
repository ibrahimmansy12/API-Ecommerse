// features/ui/signup/ui/signup_screen.dart
import 'package:apiecommerse/core/helper/spacing.dart';
import 'package:apiecommerse/core/theming/colors_manager.dart';
import 'package:apiecommerse/core/theming/text_style.dart';
import 'package:apiecommerse/core/widgets/app_text_button.dart';
import 'package:apiecommerse/features/logic/signup/logic/cubit/signup_cubit.dart';
import 'package:apiecommerse/features/ui/login/ui/login_screen.dart';
import 'package:apiecommerse/features/ui/login/ui/widgets/termes_and_conitions_text.dart';
import 'package:apiecommerse/features/ui/signup/ui/widgets/already_have_an_account.dart';
import 'package:apiecommerse/features/ui/signup/ui/widgets/signup_bloc_listner.dart';
import 'package:apiecommerse/features/ui/signup/ui/widgets/signup_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<SignupScreen> {
  //bool isObsecureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MyColorsManager.black,
        body: SafeArea(
            child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 3.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpace(10),
                Text(
                  "Welcome\nBack!",
                  style: MyTextStyles.font28WhiteBold,
                ),
                verticalSpace(1),
                // SizedBox(
                //   height: 8.h,
                // ),
                Text(
                  "We're excited to have you back, can't wait to see what you've been up to since you last logged in.",
                  style: MyTextStyles.font13Whiteregular,
                ),
                verticalSpace(6),
                Column(
                  children: [
                    const SignupForm(),
                    // verticalSpace(24),
                    // Align(
                    //   alignment: AlignmentDirectional.centerEnd,
                    //   child: Text(
                    //     "Forget Password?",
                    //     style: TextStyles.font13blueregular,
                    //   ),
                    // ),
                    verticalSpace(2),
                    MyTextButton(
                      backGroundColor: MyColorsManager.darkGrey,
                      buttonText: "Signup",
                      textStyle: MyTextStyles.font16BlacksemBold,
                      onpressed: () {
                        validateThenDoLogin(context);
                      },
                    ),
                    verticalSpace(2),
                    const TermesAndConitionsText(),
                    verticalSpace(2),
                    const AlreadyHaveAnAccount(), const SignupBlocListner(),
                  ],
                )
              ],
            ),
          ),
        )));
  }
}

void validateThenDoSignup(BuildContext context) {
  if (context.read<SignupCubit>().formkey.currentState!.validate()) {
    context.read<SignupCubit>().emaitSignup();
  }
}
