import 'dart:async';

import 'package:talento/core/broadcast_base_bloc.dart';

import '../core/base_bloc.dart';

class ListBloc<T> extends BroadcastBaseBloc<List<T>> {
  void add(String tag, List<String> list) {
    if(list.contains(tag)) return;
    list.add(tag);
    emit(list as List<T>);
  }

  void remove(String e, List<String> list) {
    if(!list.contains(e)) return;
    list.remove(e);
    emit(list as List<T>);
  }


}