// features/data/login/data/repo/login_repo.dart
import 'package:apiecommerse/core/networking/api_service.dart';
import 'package:apiecommerse/features/data/login/data/models/login_request_body.dart';
import 'package:apiecommerse/features/data/login/data/models/login_response.dart';

import '../../../../../core/networking/api_handler.dart';
import '../../../../../core/networking/api_result.dart';

class LoginRepo {
  final ApiService _apiService;

  LoginRepo(this._apiService);
  Future<ApiResult<LoginResponse>> login(
      LoginRequestBody loginRequestBody) async {
    try {
      final responce = await _apiService.login(loginRequestBody);
      return ApiResult.success(responce);
    } catch (e) {
      return ApiResult.failure(ApiHandler.handle(e));
    }
  }
}
