// features/ui/signup/ui/widgets/already_have_an_account.dart
import 'package:apiecommerse/core/helper/extention.dart';
import 'package:apiecommerse/core/routing/routs.dart' show ERouts;
import 'package:apiecommerse/core/theming/text_style.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class AlreadyHaveAnAccount extends StatelessWidget {
  const AlreadyHaveAnAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
        textAlign: TextAlign.center,
        text: TextSpan(children: [
          TextSpan(
              text: "Already have an account",
              style: MyTextStyles.font13Whiteregular),
          TextSpan(
              text: "Login",
              style: MyTextStyles.font15WhiteextraBold,
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  context.pushReplacementNamed(ERouts.loginScreen);
                })
        ]));
  }
}
