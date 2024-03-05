

import 'package:talento/core/base_bloc.dart';
import 'dart:math' as math;

import '../models/response.dart';

class SampleBloc extends BaseBloc<Response> {
  void getTickerData() async {
    emit(Response.loading(''));
  }

  void generateRandomValue() {
    int randomValue = math.Random().nextInt(100);
    emit(Response.completed(randomValue));
  }
}