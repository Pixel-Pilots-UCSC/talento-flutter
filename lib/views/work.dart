import 'package:flutter/material.dart';
import 'package:talento/widgets/form_field.dart' as custom;

class WorkEx extends StatelessWidget {
  const WorkEx({super.key});

  @override
  Widget build(BuildContext context) {
    bool? _isChecked = false;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.black,
          backgroundColor: Colors.transparent,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: <Widget>[
                const SizedBox(height: 20),
                const Text(
                  'Add Work Experience',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 50),
                const custom.FormField(
                  minlines: 1,
                  maxlines: 1,
                  title: 'Job Title',
                  hintText: 'Manager',
                ),
                const SizedBox(height: 20),
                const custom.FormField(
                  minlines: 1,
                  maxlines: 1,
                  title: 'Company',
                  hintText: 'ABC Dev Solutions',
                ),
                const SizedBox(height: 20),
                const Row(
                  children: [
                    SizedBox(
                      width: 205,
                      child: custom.FormField(
                        minlines: 1,
                  maxlines: 1,
                        title: 'Start Date',
                        hintText: 'DD/MM/YY',
                      ),
                    ),
                    SizedBox(
                      width: 205,
                      child: custom.FormField(
                        minlines: 1,
                  maxlines: 1,
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
                const SizedBox(
                  // height: 50,
                  child: custom.FormField(
                    minlines: 5,
                  maxlines: 5,

                    title: 'Description',
                    hintText: 'Loream ipsum is',
                  ),
                ),
                SizedBox(height: 50),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.resolveWith(
                          (Set<MaterialState> states) {
                        if (states.contains(MaterialState.disabled)) {
                          return RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          );
                        }
                        return RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        );
                      }),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.green),
                    ),
                    onPressed: () {},
                    child: const Center(
                      child: Text(
                        'Save',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                                SizedBox(height: 50),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
