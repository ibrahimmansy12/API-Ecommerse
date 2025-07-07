// features/logic/signup/logic/cubit/signup_state.dart



import 'package:apiecommerse/core/networking/api_error_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'signup_state.freezed.dart';
@freezed
class SignupState<T> with _$SignupState<T> {
  const factory SignupState.initial() = _Initial;
  const factory SignupState.loading() = Loading;
  const factory SignupState.success(T data) = Success<T>;
  const factory SignupState.failure(ApiErrorModel apiErrorModel,) = Error;

}
