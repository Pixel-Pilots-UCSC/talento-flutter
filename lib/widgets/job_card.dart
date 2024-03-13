import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:talento/views/employee/job_detail.dart';

class JobCard extends StatelessWidget {
  String id;
  String title;
  String company;
  String location;
  String salary;
  String imageUrl;
  bool bookmarked;
  String jobType;
  Color color;

  JobCard(
      {super.key,
      required this.id,
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
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => JobDetail(
              jobId: id,
            ),
          ));
      },
      child: Container(
        margin: const EdgeInsets.only(right: 5),
        width: 250,
        padding: const EdgeInsets.all(2),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 0.5,
              blurRadius: 1,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    width: 250,
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      )
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                      child: Image.network(
                        imageUrl,
                        width: 200,
                        height: 100,
                        fit: BoxFit.cover,
                        loadingBuilder: (BuildContext context, Widget child,
                            ImageChunkEvent? loadingProgress) {
                          if (loadingProgress == null) {
                            return child;
                          }
                          return Skeletonizer(
                            enabled: true,
                            child: Container(
                              width: 200,
                              height: 150,
                              decoration: BoxDecoration(
                                color: Colors.grey[800],
                              )
                            ),
                          );
                        }
                      ),
                    ),
                  ),
                  Positioned(
                    top: 5,
                    right: 5,
                    child: Container(
                      width: 30,
                      height: 30,
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Theme.of(context).colorScheme.background.withOpacity(0.7),
                      ),
                      child: bookmarked
                          ?  Icon(
                              Icons.bookmark,
                              color: Theme.of(context).colorScheme.onBackground,
                              size: 20,
                            )
                          : Icon(
                              Icons.bookmark_border,
                              color: Theme.of(context).colorScheme.onBackground,
                              size: 20,
                            ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                    color: color,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 70,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AutoSizeText(
                              title,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                //invert the color of the text to make it readable by inverting the color of the container
                                color:Theme.of(context).colorScheme.background == Colors.black ?
                                Colors.white70 : Colors.black87

                              ),
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                            AutoSizeText(
                              '$company - $location',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 10,
                                color: Theme.of(context).colorScheme.background == Colors.black ?
                                Colors.white70 : Colors.black87
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 2,
                              horizontal: 10,
                            ),
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.background == Colors.black ?
                                Colors.white70 : Colors.black87,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Text(
                              jobType,
                              style:TextStyle(
                                fontSize: 12,
                                color: Theme.of(context).colorScheme.background == Colors.black ?
                                Colors.black87 : Colors.white
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 0,
                              horizontal: 10,
                            ),
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.background == Colors.black ?
                                Colors.white70 : Colors.black87,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Row(
                              children: [
                                Text(
                                  '\$$salary',
                                  style: TextStyle(
                                    color: Theme.of(context).colorScheme.background == Colors.black ?
                                    Colors.black87 : Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                                const SizedBox(
                                  width: 2,
                                ),
                                Text(
                                  "/",
                                  style: TextStyle(
                                    color: Theme.of(context).colorScheme.background == Colors.black ?
                                    Colors.black54: Colors.white60,
                                    fontSize: 10,
                                  ),
                                ),
                                const SizedBox(
                                  width: 2,
                                ),
                                Text(
                                  "Mo",
                                  style: TextStyle(
                                    color: Theme.of(context).colorScheme.background == Colors.black ?
                                    Colors.black54: Colors.white60,
                                    fontSize: 10,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
