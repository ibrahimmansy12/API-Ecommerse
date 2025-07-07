// features/logic/favorites/favorites_state.dart
// part 'favorites_cubit.dart';
import 'package:apiecommerse/features/data/cart/data/product_hive_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'favorites_state.freezed.dart';

@freezed
abstract class FavoritesState with _$FavoritesState {
  const factory FavoritesState.initial() = _Initial;
  const factory FavoritesState.loading() = Loading;
  const factory FavoritesState.success(
      {List<ProductHiveModel>? cartmodellist}) = Success;
  const factory FavoritesState.error() = Error;

  const factory FavoritesState.putsuccess(
      {List<ProductHiveModel>? cartmodellist,
      ProductHiveModel? cartmodel}) = PutSuccess;
}
