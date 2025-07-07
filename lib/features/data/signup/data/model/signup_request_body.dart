// features/data/signup/data/model/signup_request_body.dart
import 'package:freezed_annotation/freezed_annotation.dart';
part 'signup_request_body.g.dart';

@JsonSerializable()
class SignupRequestBody {
  final String name;
  final String email;
  final String phone;
  final String password;
  @JsonKey(name: 'password_confirmation')
  final String passwordConfirmation;
  //final String? address;
  SignupRequestBody( 
      {required this.name,required this.email,required this.phone,required this.password,required this.passwordConfirmation,
       });
  Map<String, dynamic> toJson() => _$SignupRequestBodyToJson(this);
}
