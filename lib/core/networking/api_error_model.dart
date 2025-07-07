// core/networking/api_error_model.dart
// ignore_for_file: public_member_api_docs, sort_constructors_first
//import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:apiecommerse/core/helper/extention.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_error_model.g.dart';

@JsonSerializable()
class ApiErrorModel {
  final String? message;
  final int? code;
  @JsonKey(name: "data")
  final Map<String, dynamic>? errors;

  ApiErrorModel({
    this.message,
    this.code,
    this.errors,
  });
  factory ApiErrorModel.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorModelFromJson(json);

  Map<String, dynamic> toJson() => _$ApiErrorModelToJson(this);
  String getAllErrors() {
    if (errors.isNullOrEmpty()) return message ?? "No errors found";

    final errorsMessage = errors!.entries.map(
      (entry) {
        List value = entry.value;
        return value.join(",");
      },
    ).join("\n");
    return errorsMessage;
  }
}
