import 'package:flutter/material.dart';
import 'package:talento/models/applicant_model.dart';

class ApplicantListPage extends StatelessWidget {
  final List<Applicant> applicants;

  ApplicantListPage({required this.applicants});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Applicants')),
      body: ListView.builder(
        itemCount: applicants.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ApplicantDetailsPage(applicant: applicants[index]),
                ),
              );
            },
            child: ListTile(
              title: Text(applicants[index].name),
              subtitle: Text(applicants[index].position),
            ),
          );
        },
      ),
    );
  }
}