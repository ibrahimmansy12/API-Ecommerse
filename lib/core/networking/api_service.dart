// core/networking/api_service.dart
import 'package:apiecommerse/core/networking/api_constanse.dart';
import 'package:apiecommerse/features/data/home/data/model/categories_model.dart';
import 'package:apiecommerse/features/data/home/data/model/favorite_model.dart';
import 'package:apiecommerse/features/data/home/data/model/prudact_model.dart';
import 'package:apiecommerse/features/data/login/data/models/login_request_body.dart';
import 'package:apiecommerse/features/data/login/data/models/login_response.dart';
import 'package:apiecommerse/features/data/signup/data/model/signup_request_body.dart';
import 'package:apiecommerse/features/data/signup/data/model/signup_responce_body.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstanse.apiBaseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(ApiConstanse.login)
  Future<LoginResponse> login(
    @Body() LoginRequestBody loginRequestbody,
  );

  @POST(ApiConstanse.signup)
  Future<SignupResponceBody> signup(
    @Body() SignupRequestBody signupRequestBody,
  );
  @GET(ApiConstanse.getProducts)
  Future<ProductModel> getProducts({@Header('lang') String lang="en"});
  @GET(ApiConstanse.getCategories)
  Future<CategoriesModel> getCategories({@Header('lang') String lang="en"});
  @GET("categories/{id}")
  Future<ProductModel> getCategoriesProductByIndex({@Header('lang') String lang="en", @Path('id') int index=44});
   @GET(ApiConstanse.favorites)
  Future<FavoriteResponseModel> addToFavorite({@Header('lang') String lang="en", @Header('Authorization') String? token, @Body() FavoriteRequestModel? favoriteRequestModel});
  
  //  @GET(ApiConstanse.doctors)
  // Future<SearchModel> getDoctors();
}
