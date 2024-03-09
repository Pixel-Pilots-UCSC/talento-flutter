

import 'package:flutter/material.dart';

class FilterView extends StatelessWidget {
  const FilterView({super.key});

  @override
  Widget build(BuildContext context) {
    // List of Search Filters as Industry Selection, Category Selection, Location Selection, Salary Range, Job Tags
    List<String> industry = ['IT', 'Health', 'Finance', 'Education', 'Engineering', 'Hospitality', 'Others'];
    List<String> category = ['Full Time', 'Part Time', 'Contract', 'Internship', 'Freelance'];
    List<String> location = ['Kathmandu', 'Lalitpur', 'Bhaktapur', 'Pokhara', 'Chitwan', 'Biratnagar', 'Others'];
    List<String> jobTags = ['Remote', 'Work From Home', 'Onsite', 'Flexible', 'Part Time', 'Full Time', 'Contract', 'Internship', 'Freelance', 'Temporary', 'Permanent', 'Others'];

    return Scaffold(
      appBar: AppBar(
        title: Text('Filter'),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            // Industry Selection
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Industry'),
                  // TypeAheadField<String>(
                  //   textFieldConfiguration: TextFieldConfiguration(
                  //     decoration: InputDecoration(
                  //       labelText: 'Select Industry',
                  //       border: OutlineInputBorder(
                  //         borderRadius: BorderRadius.circular(10),
                  //       ),
                  //     ),
                  //   ),
                  //   suggestionsCallback: (pattern) {
                  //     return industry.where((element) => element.toLowerCase().contains(pattern.toLowerCase()));
                  //   },
                  //   itemBuilder: (context, suggestion) {
                  //     return ListTile(
                  //       title: Text(suggestion),
                  //     );
                  //   },
                  //   onSuggestionSelected: (suggestion) {
                  //     print(suggestion);
                  //   },
                  // ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
