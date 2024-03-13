import 'package:flutter/material.dart';

class Applicant {
  final String fullName;
  final String email;
  final String phone;
  final String address;
  final String resumeUrl;
  final String coverLetterUrl;
  final String education;
  final List<WorkExperience> workExperiences;
  final List<String> skills;
  final String availability;

  Applicant({
    required this.fullName,
    required this.email,
    required this.phone,
    required this.address,
    required this.resumeUrl,
    required this.coverLetterUrl,
    required this.education,
    required this.workExperiences,
    required this.skills,
    required this.availability
  });
}

class WorkExperience {
  final String employer;
  final String jobTitle;
  final String startDate;
  final String endDate;
  final String responsibilities;

  WorkExperience({
    required this.employer,
    required this.jobTitle,
    required this.startDate,
    required this.endDate,
    required this.responsibilities,
  });
}

//  create list of job applicants
List<Applicant> jobApplicants = [
  Applicant(
    fullName: 'John Doe',
    email: 'john_doe@gmail.com',
    phone: '123-456-7890',
    address: '1234 Main St, Anytown, USA',
    resumeUrl: 'https://www.example.com/resume',
    coverLetterUrl: 'https://www.example.com/cover-letter',
    education: 'B.S. in Computer Science',
    workExperiences: [
      WorkExperience(
        employer: 'ABC Corp',
        jobTitle: 'Software Engineer',
        startDate: '01/01/2020',
        endDate: '12/31/2020',
        responsibilities: 'Developed software applications',
      ),
      WorkExperience(
        employer: 'XYZ Corp',
        jobTitle: 'Software Developer',
        startDate: '01/01/2019',
        endDate: '12/31/2019',
        responsibilities: 'Developed software applications',
      ),
    ],
    skills: ['Java', 'Python', 'C++', 'JavaScript'],
    availability: 'Full-time',
  ),

];
