//import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:json_annotation/json_annotation.dart';
part 'signup_responce_body.g.dart';


@JsonSerializable()
class SignupResponceBody {
  String? message;
  @JsonKey(name: "data")
  UserData? userData;
  bool? status;
  int? code;

  SignupResponceBody({this.message, this.userData, this.status, this.code});
  factory SignupResponceBody.fromJson(Map<String, dynamic> json) =>
      _$SignupResponceBodyFromJson(json);
}

@JsonSerializable()
class UserData {
  String? token;
  @JsonKey(name: 'username')
  String? userName;
  UserData({this.token, this.userName});
  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);
}
