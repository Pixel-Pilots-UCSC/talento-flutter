

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoaderUtil{

  static showLoader(BuildContext context,{String message = 'loading...'}){
    EasyLoading.show(
      status: message,
      indicator: SpinKitWave(color: Theme.of(context).primaryColor),
      maskType: EasyLoadingMaskType.black,
    );
  }

  static hideLoader(){
    EasyLoading.dismiss();
  }
}