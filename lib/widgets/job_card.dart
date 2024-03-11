import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:skeletonizer/skeletonizer.dart';

class JobCard extends StatelessWidget {
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
    return Container(
      margin: const EdgeInsets.only(right: 5),
      width: 250,
      height: 100,
      padding: const EdgeInsets.all(2),
      child: Container(
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
                      height: 150,
                      fit: BoxFit.cover,
                      loadingBuilder: (BuildContext context, Widget child,
                          ImageChunkEvent? loadingProgress) {
                        if (loadingProgress == null) {
                          return child;
                        }
                        return Center(
                          child: Skeletonizer(
                            enabled: loadingProgress.expectedTotalBytes == null,
                            child: Container(
                              width: 200,
                              height: 150,
                            ),
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
                        ? const Icon(
                            Icons.bookmark,
                            color: Colors.black,
                            size: 20,
                          )
                        : const Icon(
                            Icons.bookmark_border,
                            color: Colors.black,
                            size: 20,
                          ),
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.all(20),
              height: 146,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                color: color,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
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
                          vertical: 5,
                          horizontal: 10,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                          jobType,
                          style:TextStyle(
                            color:Colors.black
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 5,
                          horizontal: 10,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Row(
                          children: [
                            Text(
                              '\$$salary',
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(
                              width: 2,
                            ),
                            Text(
                              "/",
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 10,
                              ),
                            ),
                            const SizedBox(
                              width: 2,
                            ),
                            Text(
                              "Mo",
                              style: const TextStyle(
                                color: Colors.grey,
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
          ],
        ),
      ),
    );
  }
}
