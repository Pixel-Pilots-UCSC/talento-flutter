import 'package:flutter/material.dart';
import 'package:talento/widgets/form_field.dart' as custom;

class WorkEx extends StatelessWidget {
  const WorkEx({super.key});

  @override
  Widget build(BuildContext context) {
    bool? _isChecked = false;
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              const SizedBox(height: 50),
              const Text(
                'Add Work Experience',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              const custom.FormField(
                title: 'Job Title',
                hintText: 'Manager',
              ),
              const SizedBox(height: 20),
              const custom.FormField(
                title: 'Company',
                hintText: 'ABC Dev Solutions',
              ),
              const SizedBox(height: 20),
              const Row(
                children: [
                  SizedBox(
                    width: 205,
                    child: custom.FormField(
                      title: 'Start Date',
                      hintText: 'DD/MM/YY',
                    ),
                  ),
                  SizedBox(
                    width: 205,
                    child: custom.FormField(
                      title: 'End Date',
                      hintText: 'DD/MM/YY',
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Row(
                  children: [
                    Checkbox(
                      value: _isChecked,
                      onChanged: (bool? value) {},
                      activeColor: Colors.green,
                      checkColor: Colors.white,
                    ),
                    Text('This is my current position'),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                // height: 50,
                child: const custom.FormField(
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
