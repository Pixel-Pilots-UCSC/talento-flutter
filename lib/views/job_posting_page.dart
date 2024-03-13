import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/job_tiles.dart';

class JobPostingPage extends StatelessWidget {
  const JobPostingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: <Widget>[
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.forward),
                color: Colors.black,
                onPressed: () {
                  // do something
                },
              ),
              IconButton(
                icon: const Icon(Icons.settings_outlined),
                color: Colors.black,
                onPressed: () {
                  // do something
                },
              ),
            ],
          )
        ],
          leading: Builder(
              builder: (context) {
                return IconButton(
                  icon: const Icon(Icons.menu),
                  color: Colors.black,
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                );
              }
          )

      ),
      body: SafeArea(
        child: Center(
          child: Container(
            child: Column(
              children: <Widget>[
                const SizedBox(height: 16),
                Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  child:  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.search,

                                    ),
                                    Text(
                                      'Search Jobs',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFF3EB489)
                                      ),
                                    ),

                                  ],
                                )
                              ],
                            ),


                          ),
                          SizedBox(width: 100),
                          Container(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.sort,

                                    )

                                  ],
                                )
                              ],
                            ),


                          )

                        ],
                      )
                      ]

                  )
                ),
                const SizedBox(height: 16),
                Container(
                  height: 70,
                  width: 300,
                  color: Colors.teal,
                  padding: EdgeInsets.all(16.0),
                  child: const Center(
                    child: Row(
                      children: [
                        Icon(
                          Icons.add,
                              color: Colors.white,
                          size: 30.0,
                        ),
                        Text(
                            'Create a New Job',
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white
                          ),
                          textAlign: TextAlign.center,

                        ),

                      ],
                    )
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  margin: const EdgeInsets.only(top: 16),
                  child:
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Recently Created',
                              style: TextStyle(fontSize: 18.0),
                            ),
                            Text(
                              'See all',
                              style: TextStyle(color: Colors.blue),
                            ),
                          ],
                        ),
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: 2, // Replace with the number of jobs
                        itemBuilder: (context, index) =>
                          JobTiles(
                          title: 'No Title',
                          company: 'No Location',
                          location: 'No Location',
                          salary: '10,000',
                          imageUrl: "https://miro.medium.com/v2/resize:fit:800/1*eYPD6Nie7QROiA6n0uPSTQ.png",
                          bookmarked: false,
                          jobType: "Remote",
                          color: Theme.of(context).colorScheme.background == Colors.black ? Color(0xFF36454F) : Color(
                              0xFFB2FFE2)
                      )
                      ),
                    ],
                  ),

                )
              ]
            )
          )
        )
      )





    );
  }

}