import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
                                    Text(
                                      'Search Jobs',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFF3EB489)
                                      ),
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
                  child: const Center(
                    child: Row(
                      children: [
                        Icon(
                          Icons.add
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
                )
              ]
            )
          )
        )
      )





    );
  }

}