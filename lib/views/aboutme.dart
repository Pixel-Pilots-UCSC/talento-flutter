import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart' hide FormField;
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:talento/utils/custom_icons.dart';
import 'package:talento/widgets/form_field.dart' as custom;

class AboutMe extends StatelessWidget {
  const AboutMe({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: const SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(height: 50),
              Text(
                'About Me',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              custom.FormField(
                title: 'Full Name',
                hintText: 'Enter your full name',
              ),
              SizedBox(height: 20),
              custom.FormField(
                title: 'Date of Birth',
                hintText: 'DD/MM/YY',
              ),
              SizedBox(height: 20),
              custom.FormField(
                title: 'Email',
                hintText: 'Johndoe@gmail.com',
              ),
              SizedBox(height: 20),
              custom.FormField(
                title: 'Links',
                hintText: 'DD/MM/YY',
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
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
              SizedBox(height: 20),
              custom.FormField(
                title: 'Date of Birth',
                hintText: 'DD/MM/YY',
              ),
              SizedBox(height: 20),
              custom.FormField(
                title: 'Date of Birth',
                hintText: 'DD/MM/YY',
              ),
              SizedBox(height: 20),
              custom.FormField(
                title: 'Date of Birth',
                hintText: 'DD/MM/YY',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
