import 'package:bloc/bloc.dart';
import 'package:vita_quest/core/helpers/navigation_helper.dart';

import '../../../../core/routing/routes.dart';

part 'on_boarding_state.dart';

class OnBoardingCubit extends Cubit<OnBoardingState> {
  OnBoardingCubit() : super(OnBoardingInitial());

  int index = 0;
  increaseIndex() {
    index == 4 ? null : index++;
    emit(IndexChanged());
  }

  decreaseIndex(context) {
    index == 0 ? navigateTo(context, Routes.splash, removeAll: true) : index--;
    emit(IndexChanged());
  }

  skip(context) {
    index = 4;
    emit(IndexChanged());
  }
}
