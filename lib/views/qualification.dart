import 'package:flutter/material.dart';
import 'package:talento/widgets/form_field.dart' as custom;

class Qualification extends StatelessWidget {
  const Qualification({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.transparent,
      ),
      body:  const SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(height: 50),
              Text(
                'Add Qualification',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              custom.FormField(
                title: 'Qualification',
                hintText: 'Monash University',
              ),
              SizedBox(height: 20),
              custom.FormField(
                      title: 'Start Date',
                      hintText: 'DD/MM/YY',
                    ),
              SizedBox(height: 20),
              
              SizedBox(height: 20),
              SizedBox(
                // height: 50,
                child: custom.FormField(
                  title: 'Description',
                  hintText: 'Loream ipsum is',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
