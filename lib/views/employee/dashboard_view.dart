

import 'package:flutter/material.dart';

import '../../widgets/job_card.dart';

class DashboardView extends StatelessWidget {
  DashboardView({super.key});

  List<JobCard> jobList = [
    JobCard(
      title: 'Software Engineer',
      company: 'Google',
      location: 'Remote',
      salary: '100,000',
      imageUrl: 'https://www.shutterstock.com/image-vector/luxury-building-construction-company-logo-260nw-1383756005.jpg',
      bookmarked: false,
      jobType: 'Full Time',
      color: Color(0xFFFFD5B1),
    ),
    JobCard(
      title: 'Software Engineer',
      company: 'Google',
      location: 'Remote',
      salary: '100,000',
      imageUrl: 'https://www.shutterstock.com/image-vector/luxury-building-construction-company-logo-260nw-1383756005.jpg',
      bookmarked: false,
      jobType: 'Full Time',
      color: Color(0xFFC6E7FF),
    ),
    JobCard(
      title: 'Software Engineer',
      company: 'Google',
      location: 'Remote',
      salary: '100,000',
      imageUrl: 'https://www.shutterstock.com/image-vector/luxury-building-construction-company-logo-260nw-1383756005.jpg',
      bookmarked: false,
      jobType: 'Full Time',
      color: const Color(0xFFFFCCD1),
    ),
    JobCard(
      title: 'Software Engineer',
      company: 'Google',
      location: 'Remote',
      salary: '100,000',
      imageUrl: 'https://www.shutterstock.com/image-vector/luxury-building-construction-company-logo-260nw-1383756005.jpg',
      bookmarked: false,
      jobType: 'Full Time',
      color: Color(0xFFFFCCD1),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.settings),
          ),
        ],
        shadowColor: Colors.black54,
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              height: 300,
              decoration: BoxDecoration(
              ),
              alignment: Alignment.center,
              margin: const EdgeInsets.only(top: 10),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: jobList.length,
                itemBuilder: (context, index) {
                  return jobList[index];
                },
              ),
            )
          ],
        )
      ),
    );
  }
}
