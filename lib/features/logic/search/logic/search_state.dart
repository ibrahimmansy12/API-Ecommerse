// features/logic/search/logic/search_state.dart

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/networking/api_error_model.dart';
import '../../../data/home/data/model/prudact_model.dart';
part 'search_state.freezed.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState.initial() = _Initial;
  const factory SearchState.productLoading() = SearchLoading;
  const factory SearchState.productSuccess(
      List<ProductDataDetails> productsDataList) = SearchSuccess;
  const factory SearchState.productError(ApiErrorModel apiErrorModel) =
      SearchError;
}
