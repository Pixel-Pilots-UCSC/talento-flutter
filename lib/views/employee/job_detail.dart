

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:talento/models/response.dart';
import 'package:talento/models/single_job.dart';
import 'package:talento/widgets/app_bar.dart';

import '../../bloc/single_job_bloc.dart';

class JobDetail extends StatelessWidget {
  final String jobId;
  JobDetail({super.key, required this.jobId});

  final SingleJobBloc jobBloc = SingleJobBloc();
  bool initialized = false;
  final _scaffoldKey = GlobalKey<ScaffoldState>();


  getJobDetail() async {
    // Fetch job details from the server
    await jobBloc.getJobDetail(jobId);
  }

  @override
  Widget build(BuildContext context) {
    if (!initialized) {
      initialized = true;
      getJobDetail();
    }
    return Scaffold(
      appBar: CustomAppBar(
        scaffoldKey: _scaffoldKey,
      ),
      body: SafeArea(
        child: Column(
          children: [
            StreamBuilder<Response<SingleJob>>(
              stream: jobBloc.state,
              builder: (context, snapshot) {
                if (snapshot.hasData && snapshot.data!.status == Status.COMPLETED) {
                  Data data = snapshot.data!.data!.data!;
                  String salary = ((data.salaryRange!.low! + data.salaryRange!.high!)~/2).toStringAsFixed(0);
                  return Container(
                    height: MediaQuery.of(context).size.height - 166,
                    child: SingleChildScrollView(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10),
                                  ),
                                  child: Image.network(
                                    data.company!.logo!,
                                    width: 80,
                                    height: 80,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      data.title!,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                    Text(
                                      "${data.company!.name} - ${data.location}",
                                      style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            // Job Type
                            Container(
                              margin: EdgeInsets.only(top: 10),
                              child: Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                    decoration: BoxDecoration(
                                      color: Theme.of(context).colorScheme.onBackground,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Text(
                                      data.jobType!,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Theme.of(context).colorScheme.background,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 5),
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                    decoration: BoxDecoration(
                                      color: Theme.of(context).colorScheme.onBackground,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Text(
                                      data.createdAt!,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Theme.of(context).colorScheme.background,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // Job Description
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(top: 10),
                                  child: Text(
                                    "Job Description",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 10),
                                  child: Text(
                                    data.description!,
                                    style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(top: 10),
                                  child: Text(
                                    "Job Description",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 10),
                                  child: Text(
                                    data.description!,
                                    style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(top: 10),
                                  child: Text(
                                    "Job Description",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 10),
                                  child: Text(
                                    data.description!,
                                    style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(top: 10),
                                  child: Text(
                                    "Job Description",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 10),
                                  child: Text(
                                    data.description!,
                                    style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            // Job Requirements
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(top: 10),
                                  child: Text(
                                    "Job Requirements",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 10),
                                  child: ListView.separated(
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemCount: data.requirements!.length,
                                    itemBuilder: (context, index) {
                                      return Text(
                                        data.requirements![index],
                                        style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 14,
                                        ),
                                      );
                                    },
                                    separatorBuilder: (context, index) {
                                      return SizedBox();
                                    },
                                  ),
                                ),
                              ],
                            ),
                            // Job Responsibilities
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(top: 10),
                                  child: Text(
                                    "Job Responsibilities",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 10),
                                  child: ListView.separated(
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemCount: data.responsibilities!.length,
                                    itemBuilder: (context, index) {
                                      return Text(
                                        data.responsibilities![index],
                                        style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 14,
                                        ),
                                      );
                                    },
                                    separatorBuilder: (context, index) {
                                      return SizedBox();
                                    },
                                  ),
                                ),
                              ],
                            ),
                            // About the Company
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(top: 10),
                                  child: Text(
                                    "About the Company",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 10),
                                  child: Text(
                                    data.company!.name!,
                                    style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                } else if (snapshot.hasData && snapshot.data!.status == Status.ERROR) {
                  return Text(snapshot.data!.message!);
                }
                return CircularProgressIndicator();
              },
            ),
            Divider(
              color: Theme.of(context).colorScheme.background == Colors.white ? Colors.grey[200] : Colors.grey[800],
              height: 1,
            ),
            // Apply Button
            Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(5),
            child: Row(
              children: [
                //Bookmark Icon Button
                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.background == Colors.white ? Colors.grey[200] : Colors.grey[800],
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                    ),
                  ),
                  child: IconButton(
                    padding: const EdgeInsets.all(2),
                    visualDensity: VisualDensity.compact,
                    onPressed: () {
                      // Bookmark the job
                    },
                    icon: Icon(Icons.bookmark_border, color: Theme.of(context).colorScheme.onBackground),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Container(
                    child: ElevatedButton(
                      onPressed: () {
                        // Apply for the job
                      },
                      child: Text("Apply"),
                    ),
                  ),
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
