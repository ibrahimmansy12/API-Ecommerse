// features/ui/login/ui/login_screen.dart
import 'package:apiecommerse/core/theming/colors_manager.dart';
import 'package:apiecommerse/core/theming/text_style.dart';
import 'package:apiecommerse/core/widgets/app_text_button.dart';
import 'package:apiecommerse/features/logic/log%20in/logic/cubit/login_cubit.dart'
    show LoginCubit;
import 'package:apiecommerse/features/ui/login/ui/widgets/donot_have_an_account.dart';
import 'package:apiecommerse/features/ui/login/ui/widgets/email_and_password.dart';
import 'package:apiecommerse/features/ui/login/ui/widgets/login_bloc_listner.dart'
    show LoginBlocListner;
import 'package:apiecommerse/features/ui/login/ui/widgets/termes_and_conitions_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/helper/constance_helper.dart';
import '../../../../core/helper/spacing.dart' show verticalSpace;

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    isLogedInUser = false;
    print("=================isloged in = {$isLogedInUser}");
    super.initState();
  }

  //bool isObsecureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MyColorsManager.black,
        body: SafeArea(
            child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
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
                    SizedBox(child: EmailAndPassword()),
                    verticalSpace(2),
                    Align(
                      alignment: AlignmentDirectional.centerEnd,
                      child: Text(
                        "Forget Password?",
                        style: MyTextStyles.font14blueregular,
                      ),
                    ),
                    verticalSpace(4),
                    MyTextButton(
                      backGroundColor: MyColorsManager.darkGrey,
                      buttonText: "Login",
                      textStyle: MyTextStyles.font16BlacksemBold,
                      onpressed: () {
                        validateThenDoLogin(context);
                      },
                    ),
                    verticalSpace(2),
                    const TermesAndConitionsText(),
                    verticalSpace(4),
                    const DontHaveAnAccount(),
                    const LoginBlocListner(),
                  ],
                )
              ],
            ),
          ),
        )));
  }
}

void validateThenDoLogin(BuildContext context) {
  if (context.read<LoginCubit>().formkey.currentState!.validate()) {
    context.read<LoginCubit>().emaitLoginState();
  }
}
