import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Skills extends StatelessWidget {
   Skills({super.key});
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.black,
          backgroundColor: Colors.transparent,
        ),
        body: Container(
           
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: CupertinoSearchTextField(
              controller: _controller,
            ),
          ),
        ),
      ),
    );
  }
}
