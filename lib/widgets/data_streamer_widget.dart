import 'package:flutter/material.dart';
import 'package:talento/core/base_bloc.dart';

import '../models/response.dart';

class DataStreamerWidget extends StatelessWidget {
  final Widget Function(BuildContext,dynamic) childCallback;
  Widget Function(BuildContext,dynamic)? loaderCallback;
  Widget Function(BuildContext,dynamic)? errorCallback;
  final BaseBloc<Response> bloc;
  DataStreamerWidget({super.key, required this.childCallback,required this.bloc, this.loaderCallback, this.errorCallback});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Response>(
      stream: bloc.state,
      builder: (context, snapshot) {
        if(snapshot.hasData && snapshot.data?.status == Status.COMPLETED) {
          dynamic data = snapshot.data?.data;
          return childCallback(context,data);
        } else if(snapshot.hasData && snapshot.data?.status == Status.ERROR) {
          return Text(snapshot.data!.message!);
        }
        return const CircularProgressIndicator();
      }
    );
  }
}

