// features/logic/cart/cart_state.dart
import 'package:apiecommerse/features/data/cart/data/product_hive_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_state.freezed.dart';

@freezed
class CartState with _$CartState {
  const factory CartState.initial() = _Initial;
  const factory CartState.loading() = Loading;
  const factory CartState.success({List<ProductHiveModel>? cartmodellist}) =
      Success;
  const factory CartState.error() = Error;

  const factory CartState.putsuccess(
      {List<ProductHiveModel>? cartmodellist,
      ProductHiveModel? cartmodel}) = PutSuccess;

  // const factory CartState.putLoading() = PutLoading;
  // const factory CartState.putSuccess() = PutSuccess;
  // const factory CartState.putError() = PutError;

  // const factory CartState.deleteLoading() = DeleteLoading;
  // const factory CartState.deleteSuccess() = DeleteSuccess;
  // const factory CartState.deleteError() = DeleteError;
}
