// features/ui/login/ui/widgets/donot_have_an_account.dart
import 'package:apiecommerse/core/helper/extention.dart';
import 'package:apiecommerse/core/theming/text_style.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../../core/routing/routs.dart';

class DontHaveAnAccount extends StatelessWidget {
  const DontHaveAnAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
        textAlign: TextAlign.center,
        text: TextSpan(children: [
          TextSpan(
              text: "Don`t have an account",
              style: MyTextStyles.font13Whiteregular),
          TextSpan(
              text: "Sign Up",
              style: MyTextStyles.font15WhiteextraBold,
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  context.pushReplacementNamed(ERouts.signupScreen);
                })
        ]));
  }
}
