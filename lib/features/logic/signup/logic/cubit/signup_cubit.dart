// features/logic/signup/logic/cubit/signup_cubit.dart
//import 'package:bloc/bloc.dart';
import 'package:apiecommerse/features/data/signup/data/model/signup_request_body.dart';
import 'package:apiecommerse/features/data/signup/data/signup%20repo/signup_repo.dart';
import 'package:apiecommerse/features/logic/signup/logic/cubit/signup_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:freezed_annotation/freezed_annotation.dart';

// part 'signup_state.dart';
// part 'signup_cubit.freezed.dart';

class SignupCubit extends Cubit<SignupState> {
  final SignupRepo _signupRepo;
  SignupCubit(this._signupRepo) : super(const SignupState.initial());
  TextEditingController emailcontroler = TextEditingController();
  TextEditingController passwordcontroler = TextEditingController();
  TextEditingController nameControler = TextEditingController();
  TextEditingController phonecontroler = TextEditingController();
  TextEditingController passwordConfirmationController =
      TextEditingController();
  final formkey = GlobalKey<FormState>();
  void emaitSignup() async {
    emit(const SignupState.loading());
    final response = await _signupRepo.signup(SignupRequestBody(
      email: emailcontroler.text,
      phone: phonecontroler.text,
      password: passwordcontroler.text,
      passwordConfirmation: passwordConfirmationController.text,
      name: nameControler.text,
    ));
    response.when(success: (success) {
      emit(SignupState.success(success));
    }, failure: (apiErrorModel) {
      emit(SignupState.failure(
        apiErrorModel,
      ));
    });
  }
}
// //import 'package:bloc/bloc.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_advance/features/log%20in/data/models/login_request_body.dart';
// import 'package:flutter_advance/features/log%20in/data/repo/login_repo.dart';
// import 'package:flutter_advance/features/log%20in/logic/cubit/login_state.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// //import 'package:freezed_annotation/freezed_annotation.dart';

// //part 'login_state.dart';
// //part 'login_cubit.freezed.dart';

// class LoginCubit extends Cubit<LoginState> {
//   final LoginRepo _loginRepo;
//   LoginCubit(this._loginRepo) : super(const LoginState.initial());




// }