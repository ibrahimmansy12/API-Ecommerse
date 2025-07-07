// features/main/logic/main_state.dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'main_state.freezed.dart';

@freezed
abstract class MainState with _$MainState {
  const factory MainState.initial() = _Initial;
  const factory MainState.setPageIndex(int index) = SetPageIndex;
}
