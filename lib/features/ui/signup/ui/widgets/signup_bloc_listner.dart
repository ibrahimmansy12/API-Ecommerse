// features/ui/signup/ui/widgets/signup_bloc_listner.dart
import 'package:apiecommerse/core/helper/extention.dart';
import 'package:apiecommerse/core/networking/api_error_model.dart';
import 'package:apiecommerse/core/routing/routs.dart';
import 'package:apiecommerse/core/theming/text_style.dart';
import 'package:apiecommerse/features/logic/signup/logic/cubit/signup_cubit.dart';
import 'package:apiecommerse/features/logic/signup/logic/cubit/signup_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/theming/colors_manager.dart';

class SignupBlocListner extends StatelessWidget {
  const SignupBlocListner({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignupCubit, SignupState>(
      listenWhen: (previous, current) {
        return current is Loading || current is Success || current is Error;
      },
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            showDialog(
              context: context,
              builder: (context) => const Center(
                child: CircularProgressIndicator(
                  color: MyColorsManager.mainblue,
                ),
              ),
            );
          },
          success: (ainala) {
            context.pop();
            showSuccessDialog(context);
          },
          failure: (apiErrorModel ) {
            setupErrorState(context, apiErrorModel);
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }

  void showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Signup Successful'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Congratulations, you have signed up successfully!'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.blue,
                disabledForegroundColor: Colors.grey.withValues(alpha:  0.38),
              ),
              onPressed: () {
                context.pushNamed(ERouts.loginScreen);
              },
              child: const Text('Continue'),
            ),
          ],
        );
      },
    );
  }

  void setupErrorState(BuildContext context, ApiErrorModel apiErrorModel) {
    context.pop();
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              icon: const Icon(
                Icons.error,
                color: Colors.red,
                size: 32,
              ),
              content: Text(
                apiErrorModel.getAllErrors(),
                style: MyTextStyles.font14lightgrayregular,
              ),
              actions: [
                TextButton(
                    onPressed: () {
                      context.pop();
                    },
                    child: Text(
                      "Got it",
                      style: MyTextStyles.font14BlueSemyBold,
                    ))
              ],
            ));
  }
}
