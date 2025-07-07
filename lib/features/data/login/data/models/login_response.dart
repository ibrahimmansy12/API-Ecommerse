// features/data/login/data/models/login_response.dart
//import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:json_annotation/json_annotation.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  @JsonKey(name: "user")
  UserData? userData;
  String? token;

  LoginResponse({this.userData, this.token});
  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
}

@JsonSerializable()
class UserData {
  int? id;
  @JsonKey(name: 'name')
  String? name;
  String? email;
  String? phone;
  String? address;
  String? avatar;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;

  UserData({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.address,
    this.avatar,
    this.createdAt,
    this.updatedAt,
  });
  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);
}
