

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:talento/bloc/sample_bloc.dart';

import '../widgets/data_streamer_widget.dart';

class MainLayout extends StatelessWidget {
  final SampleBloc _sampleBloc = SampleBloc();
  MainLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Layout'),
      ),
      body: SafeArea(
        child: Center(
          child: DataStreamerWidget(
            bloc: _sampleBloc,
            childCallback: (BuildContext context ,data ) {
              return Text(data.toString());
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Timer.periodic(Duration(seconds: 1), (timer) {
          //   _sampleBloc.generateRandomValue();
          // });
        },
        child: const Icon(Icons.restart_alt, color: Colors.white,),
      )
    );
  }
}
