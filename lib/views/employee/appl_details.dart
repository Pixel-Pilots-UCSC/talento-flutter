import 'package:flutter/material.dart';
import 'package:talento/models/applicant_model.dart';

class ApplicantDetailsPage extends StatelessWidget {
  // get the applicants from jobapplicants list
  final List<Applicant> jobApplicants = []; // Assuming jobApplicants is a list of Applicant objects

  List<Applicant> getApplicants() {
    return jobApplicants;
  }

   List<Applicant> applicant = jobApplicants;

  ApplicantDetailsPage({required this.applicant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Applicant Details')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Name: ${applicant.}'),
            Text('Position: ${applicant.position}'),
            ElevatedButton(
              onPressed: () {
                // Implement interview scheduling logic
              },
              child: Text('Schedule Interview'),
            ),
          ],
        ),
      ),
    );
  }
}