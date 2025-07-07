// features/logic/log in/logic/cubit/login_state.dart



import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/networking/api_error_model.dart';
part 'login_state.freezed.dart';
@freezed
class LoginState<T> with _$LoginState<T> {
  const factory LoginState.initial() = _Initial;
  const factory LoginState.loading() = Loading;
  const factory LoginState.success(T data) = Success<T>;
  const factory LoginState.failure( ApiErrorModel apiErrorModel) = Error;

}
