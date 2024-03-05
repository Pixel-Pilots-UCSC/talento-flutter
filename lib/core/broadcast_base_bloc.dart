import 'dart:async';

abstract class BaseBloc<T> {
  final StreamController<T> _stateController = StreamController<T>.broadcast();
  get state => _stateController.stream;

  void emit(T state) {
    _stateController.sink.add(state);
  }

  void dispose() {
    _stateController.close();
  }
}