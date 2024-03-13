

import 'package:flutter/cupertino.dart';
import 'package:toastification/toastification.dart';

class ToastUtil{

  showSuccessToast(BuildContext context,String title,String description,
      {int closeDuration = 3}){
    toastification.show(
      context: context,
      type: ToastificationType.success,
      style: ToastificationStyle.fillColored,
      title: Text(title),
      description: Text(description),
      alignment: Alignment.bottomCenter,
      autoCloseDuration: const Duration(seconds: 3),
      borderRadius: BorderRadius.circular(12.0),
      boxShadow: lowModeShadow,
      showProgressBar: true,
      closeButtonShowType: CloseButtonShowType.none,
      closeOnClick: false,
      dragToClose: true,
      applyBlurEffect: false,
    );
  }

  showErrorToast(BuildContext context,String title,String description,
      {int closeDuration = 3}){
    toastification.show(
      context: context,
      type: ToastificationType.error,
      style: ToastificationStyle.fillColored,
      title: Text(title),
      description: Text(description),
      alignment: Alignment.bottomCenter,
      autoCloseDuration: const Duration(seconds: 3),
      borderRadius: BorderRadius.circular(12.0),
      boxShadow: lowModeShadow,
      showProgressBar: true,
      closeButtonShowType: CloseButtonShowType.none,
      closeOnClick: false,
      dragToClose: true,
      applyBlurEffect: false,
      primaryColor: Color(0xC38F1400),
    );
  }
}