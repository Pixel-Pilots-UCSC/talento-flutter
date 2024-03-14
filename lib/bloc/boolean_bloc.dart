

import 'package:talento/core/broadcast_base_bloc.dart';


class BooleanBloc extends BroadcastBaseBloc<bool> {
  void toggle() {
    emit(!state.value);
  }

  void set(bool value) {
    emit(value);
  }
}