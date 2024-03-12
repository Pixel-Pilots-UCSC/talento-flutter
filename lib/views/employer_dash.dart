import 'package:flutter/material.dart';
import 'package:talento/layout/main_layout.dart';
import 'package:talento/themes/theme_data.dart';
import 'package:talento/views/emp_layout.dart';

class EmployerDashboard extends StatelessWidget {
  const EmployerDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: const EmpLayout(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: const Text('Employer Dashboard'),
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        onPressed: () {
          // Open the drawer
        },
        padding: EdgeInsets.all(0.0),
        icon: SizedBox(
          width: 30.0, // Adjust width and height as needed
          height: 30.0,
          child: Image.asset('assets/icons/menu.png'),
        ),
      ),
      actions: <Widget> [
        // open settings
        IconButton(
          onPressed: () {
            // Open the settings
          },
          padding: EdgeInsets.all(0.0),
          icon: SizedBox(
            width: 30.0, // Adjust width and height as needed
            height: 30.0,
            child: Image.asset('assets/icons/cogwheel.png'),
          ),
        ),
      ],
    );
  }
}
