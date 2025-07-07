// features/ui/login/ui/widgets/termes_and_conitions_text.dart
import 'package:apiecommerse/core/theming/text_style.dart';
import 'package:flutter/material.dart';

class TermesAndConitionsText extends StatelessWidget {
  const TermesAndConitionsText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(children: [
      TextSpan(
          text: 'By logging, You agreeto our',
          style: MyTextStyles.font13Whiteregular),
      TextSpan(
          text: ' Term & condition', style: MyTextStyles.font14lightGreyMedium),
      TextSpan(
          text: ' and',
          style: MyTextStyles.font13Whiteregular.copyWith(height: 1.5)),
      TextSpan(
          text: ' Privacy policy', style: MyTextStyles.font14lightGreyMedium),
    ]));
  }
}
