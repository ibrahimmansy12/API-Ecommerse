// features/data/signup/data/signup repo/signup_repo.dart

import 'package:apiecommerse/core/networking/api_handler.dart';
import 'package:apiecommerse/core/networking/api_result.dart';
import 'package:apiecommerse/features/data/signup/data/model/signup_request_body.dart';
import 'package:apiecommerse/features/data/signup/data/model/signup_responce_body.dart';

import '../../../../../core/networking/api_service.dart';

class SignupRepo {
  final ApiService _apiService;

  SignupRepo(this._apiService);
  Future<ApiResult<SignupResponceBody>> signup(
      SignupRequestBody signRequestBody) async {
    try {
      final responce = await _apiService.signup(signRequestBody);
      return ApiResult.success(responce);
    } catch (e) {
      return ApiResult.failure(ApiHandler.handle(e));
    }
  }
}
