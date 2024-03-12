


import 'package:flutter/material.dart';
import 'package:talento/core/base_bloc.dart';

class RangerBloc extends BaseBloc<RangeValues>{
  void setRange(RangeValues range){
    emit(range);
  }
}