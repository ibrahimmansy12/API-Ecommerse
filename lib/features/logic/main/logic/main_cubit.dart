// features/logic/main/logic/main_cubit.dart
import 'package:apiecommerse/features/logic/main/logic/main_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainState.initial());
  int _pageindex = 0;
  set setPageIndex(int index) {
    _pageindex = index;
  emit(MainState.setPageIndex(index));
  }
  int get pageIndex => _pageindex;
}
