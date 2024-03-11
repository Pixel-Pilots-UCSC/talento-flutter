import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart' hide FormField;
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:talento/utils/custom_icons.dart';
import 'package:talento/widgets/form_field.dart' as custom;

class AboutMe extends StatelessWidget {
  const AboutMe({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.black,
          backgroundColor: Colors.transparent,
          actions: <Widget>[
            Row(
              children: [
                IconButton(
                  icon: const Icon(CustomIcons.push),
                  color: Colors.black,
                  onPressed: () {
                    // do something
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.settings_outlined),
                  color: Colors.black,
                  onPressed: () {
                    // do something
                  },
                ),
              ],
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: <Widget>[
                const SizedBox(height: 20),
                const Text(
                  'About Me',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 50),
                const custom.FormField(
                  minlines: 1,
                  maxlines: 1,
                  title: 'Full Name',
                  hintText: 'Enter your full name',
                ),
                const SizedBox(height: 20),
                const custom.FormField(
                  minlines: 1,
                  maxlines: 1,
                  title: 'Date of Birth',
                  hintText: 'DD/MM/YY',
                ),
                const SizedBox(height: 20),
                const custom.FormField(
                  minlines: 1,
                  maxlines: 1,
                  title: 'Email',
                  hintText: 'Johndoe@gmail.com',
                ),
                const SizedBox(height: 20),
                const custom.FormField(
                  minlines: 1,
                  maxlines: 1,
                  title: 'Links',
                  hintText: 'DD/MM/YY',
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: const Offset(0, 1),
                        ),
                      ],
                    ),
                    child: const Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: IntlPhoneField(
                        decoration: InputDecoration(
                          labelText: 'Phone Number',
                          border: InputBorder.none,
                        ),
                        initialCountryCode: 'LK',
                        // onChanged: (phone) {
                        //   print(phone.completeNumber);
                        // },
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 25, vertical: 0),
                      child: Container(
                          alignment: Alignment.centerLeft,
                          child: const Text(
                            "Links",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                          )),
                    ),
                    const SizedBox(height: 6),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
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
                              MaterialStateProperty.all<Color>(Colors.white),
                        ),
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                height: 25,
                                width: 25,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.grey,
                                ),
                                child: Icon(Icons.add, color: Colors.black)),
                            SizedBox(width: 5),
                            Text(
                              'Add Link',
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
