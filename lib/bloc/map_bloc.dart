

import 'package:talento/core/base_bloc.dart';

class MapBloc extends BaseBloc<Map<String,bool>>{
  setValue(Map<String,bool> data,String key, bool value){
    data[key] = value;
    emit(data);
  }
}