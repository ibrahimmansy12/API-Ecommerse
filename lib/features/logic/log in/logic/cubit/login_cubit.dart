// features/logic/log in/logic/cubit/login_cubit.dart
//import 'package:bloc/bloc.dart';
import 'package:apiecommerse/features/logic/log%20in/logic/cubit/login_state.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/helper/constance_helper.dart';
import '../../../../../core/helper/shared_prefrance_helper.dart';
import '../../../../../core/networking/dio_factory.dart' show DioFactory;
import '../../../../data/login/data/models/login_request_body.dart' show LoginRequestBody;
import '../../../../data/login/data/repo/login_repo.dart';
//import 'package:freezed_annotation/freezed_annotation.dart';

//part 'login_state.dart';
//part 'login_cubit.freezed.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;
  LoginCubit(this._loginRepo) : super(const LoginState.initial());

  TextEditingController emailcontroler = TextEditingController();
  TextEditingController passwordcontroler = TextEditingController();
  // LoginResponse? loginResponse;
  final formkey = GlobalKey<FormState>();

  void emaitLoginState() async {
    emit(const LoginState.loading());
    final response = await _loginRepo.login(LoginRequestBody(
        email: emailcontroler.text, password: passwordcontroler.text));
    response.when(success: (success) async {
      await setToken(success.token ?? "");
      emit(LoginState.success(success));
    }, failure: (apiErrorModel) {
      emit(LoginState.failure(apiErrorModel));
    });
  }

  Future<void> setToken(String token) async {
    await SharedPrefHelper.setSecuredString(
        SharedPrefranceKeys.userToken, token);
    DioFactory.setTokenAfterLogin(token);
  }
}
