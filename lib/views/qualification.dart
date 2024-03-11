import 'package:flutter/material.dart';
import 'package:talento/widgets/form_field.dart' as custom;

class Qualification extends StatelessWidget {
  const Qualification({super.key});

  @override
  Widget build(BuildContext context) {
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
                SizedBox(height: 20),
                Text(
                  'Add Qualification',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 50),
                custom.FormField(
                  minlines: 1,
                  maxlines: 1,
                  title: 'Qualification',
                  hintText: 'Monash University',
                ),
                SizedBox(height: 20),
                custom.FormField(
                  minlines: 1,
                  maxlines: 1,
                  title: 'Start Date',
                  hintText: 'DD/MM/YY',
                ),
                SizedBox(height: 20),
                SizedBox(
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
