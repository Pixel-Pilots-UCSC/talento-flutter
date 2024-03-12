

import '../core/base_bloc.dart';

class BooleanBloc extends BaseBloc<bool> {
  void toggle() {
    emit(!state.value);
  }

  void set(bool value) {
    emit(value);
  }
}