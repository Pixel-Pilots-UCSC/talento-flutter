

import 'package:flutter/material.dart';

class JobTiles extends StatelessWidget {
  String title;
  String company;
  String location;
  String salary;
  String imageUrl;
  bool bookmarked;
  String jobType;
  Color color;

  JobTiles(
      {super.key,
        required this.title,
        required this.company,
        required this.location,
        required this.salary,
        required this.imageUrl,
        required this.bookmarked,
        required this.jobType,
        required this.color
      });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(
        imageUrl,
        width: 50,
        height: 50,
        fit: BoxFit.cover,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "$company - $location",
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 12
                ),
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(
                  jobType,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                  ),
                ),
              ),
              SizedBox(width: 5),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(
                  location,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      trailing: const Icon(Icons.more_vert),
    );
  }
}
