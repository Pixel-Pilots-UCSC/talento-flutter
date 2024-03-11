import 'package:flutter/material.dart';

class EmpMenuTile {
  final String title, image;
  final Color color;
  Function() onTap = () {
    // Navigate to the respective page
  };

  EmpMenuTile({ this.title = "", required this.image, this.color = Colors.black , required this.onTap});
}


List<EmpMenuTile> empMenuTiles = [
  EmpMenuTile(
    title: 'Applicants',
    image: 'assets/images/applicants.png',
    color: Colors.yellow,
    onTap: () {
      
    },
  ),
  EmpMenuTile(
    title: 'Shortlisted',
    image: 'assets/images/shortlisted.png',
    color: Colors.blueAccent,
    onTap: () {
      
    },
  ),
  EmpMenuTile(
    title: 'Rejected',
    image: 'assets/images/rejected.png',
    color: Colors.redAccent,
    onTap: () {
      
    },
  ),
  EmpMenuTile(
    title: 'Hired',
    image: 'assets/images/hired.png',
    color: Colors.greenAccent,
    onTap: () {
      
    },
  ),
];
