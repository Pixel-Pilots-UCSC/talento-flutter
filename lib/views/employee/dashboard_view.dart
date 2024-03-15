import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:math' as math;
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:talento/bloc/boolean_bloc.dart';
import 'package:talento/bloc/job_bloc.dart';
import 'package:talento/bloc/map_bloc.dart';
import 'package:talento/bloc/ranger_bloc.dart';
import 'package:talento/bloc/string_bloc.dart';
import 'package:talento/models/response.dart';
import 'package:talento/widgets/app_drawer.dart';

import '../../bloc/list_bloc.dart';
import '../../models/job_model.dart';
import '../../widgets/app_bar.dart';
import '../../widgets/job_card.dart';
import '../../widgets/job_tiles.dart';
import 'filter_view.dart';

class DashboardView extends StatelessWidget {
  DashboardView({super.key});
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  StringBloc industryBloc = StringBloc();
  StringBloc categoryBloc = StringBloc();
  StringBloc locationBloc = StringBloc();
  ListBloc<String> jobTagsBloc = ListBloc<String>();
  RangerBloc salaryBloc = RangerBloc();
  JobBloc jobBloc = JobBloc();
  JobBloc newJobBloc = JobBloc();
  BooleanBloc searchStartedBloc = BooleanBloc();
  TextEditingController searchController = TextEditingController();

  List<Color> lightColors = [
    Color(0xFFADD8E6),
    Color(0xFF90EE90),
    Color(0xFFFFFFE0),
    Color(0xFFFFC0CB),
    Color(0xFFF8DE7E),
    Color(0xFFE6E6FA),
    Color(0xFFF08080),
    Color(0xFF40E0D0),
    Color(0xFFD3D3D3),
    Color(0xFFF5F5DC),
  ];

  List<Color> darkColors = [
    Color(0xFF040459),
    Color(0xFF006400),
    Color(0xFF800000),
    Color(0xFF380060),
    Color(0xFF37003D),
    Color(0xFF642A01),
    Color(0xFF36454F),
    Color(0xFF015601),
    Color(0xFF8B0000),
    Color(0xFF000000),
  ];

  Color getColor(BuildContext context, int index){
    if(Theme.of(context).colorScheme.background == Colors.black){
      Color color = darkColors[index % lightColors.length];
      return color;
    }else{
      Color color = lightColors[index % darkColors.length];
      return color;
    }
  }

  MapBloc mapBloc = MapBloc();

  Map<String,bool> filterList = {
    'Full Time': false,
    'Part Time': false,
    'Remote': false,
    'Onsite': false,
  };



  @override
  Widget build(BuildContext context) {
    bool _searchStarted = false;
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(scaffoldKey: _scaffoldKey),
      drawer: AppDrawer(scaffoldKey: _scaffoldKey,selectedIndex: 0,),
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                //search bar with search filter icon
                Container(
                  height: 40,
                  margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Container(
                          height: 50,
                          padding: const EdgeInsets.only(left: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextField(
                            controller: searchController,
                            decoration: InputDecoration(
                              hintText: 'Search',
                              prefixIcon: Icon(
                                Icons.search,
                                color: Theme.of(context).colorScheme.onBackground,
                              ),
                              contentPadding: const EdgeInsets.all(0),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1,
                                  color: Color(0xFF3EB489),
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 2,
                                  color: Color(0xFF3EB489),
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              filled: true,
                              suffix: GestureDetector(
                                onTap: () {
                                  searchController.clear();
                                  jobBloc.getJobs();
                                  searchStartedBloc.emit(false);
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(2),
                                  margin: const EdgeInsets.only(right: 10),
                                  child: Icon(
                                    FeatherIcons.x,
                                    size: 16,
                                    color: Theme.of(context).colorScheme.onBackground,
                                  ),
                                ),
                              ),

                            ),
                            keyboardType: TextInputType.text,
                            onSubmitted: (value) {
                              jobBloc.searchJobs(value);
                              searchStartedBloc.emit(true);
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Container(
                        height: 40,
                        width: 40,
                        margin: const EdgeInsets.only(left: 10),
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: Color(0xFF3EB489),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => FilterView(
                                      industryBloc: industryBloc,
                                      categoryBloc: categoryBloc,
                                      locationBloc: locationBloc,
                                      jobTagsBloc: jobTagsBloc,
                                      salaryBloc: salaryBloc,
                                    )
                                )
                            );
                          },
                          icon: const Icon(
                            FeatherIcons.sliders,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                StreamBuilder<Response<Job>>(
                    stream: newJobBloc.state,
                    builder: (context, jobSnapshot) {
                      if(jobSnapshot.hasData && jobSnapshot.data!.status == Status.COMPLETED){
                        return StreamBuilder<bool>(
                            stream: searchStartedBloc.state,
                            initialData: _searchStarted,
                            builder: (context, searchSnapshot) {
                              if (searchSnapshot.hasData && !searchSnapshot.data!) {
                                return Container(
                                  height: 270,
                                  decoration: BoxDecoration(),
                                  alignment: Alignment.center,
                                  margin: const EdgeInsets.only(top: 10,left: 10,right: 10),
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: jobSnapshot.data!.data!.data!.length,
                                    addAutomaticKeepAlives: true,
                                    addRepaintBoundaries: false,
                                    itemBuilder: (context, index) {
                                      Data job = jobSnapshot.data!.data!.data![index];
                                      String salary = double.parse((job.salaryRange!.low! + job.salaryRange!.high! / 2).toString()).toStringAsFixed(0);
                                      return JobCard(
                                        id: job.sId!,
                                        title: job.title ?? 'No Title',
                                        company: job.company!.name ?? 'No Company',
                                        location: job.location ?? 'No Location',
                                        salary: salary,
                                        imageUrl: job.company!.logo ?? "https://miro.medium.com/v2/resize:fit:800/1*eYPD6Nie7QROiA6n0uPSTQ.png",
                                        bookmarked: false,
                                        jobType: job.jobType ?? "None",
                                        // color: getColor(context,index)
                                        // color: Color(0xC2232528),
                                        color: Theme.of(context).colorScheme.background == Colors.black ? Color(0xC2232528) : Color(0xFFFAFAFA),
                                      );
                                    },
                                  ),
                                );
                              }
                              return Container();
                            }
                        );
                      }
                      return Skeletonizer(
                        enabled: true,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 10,
                          addAutomaticKeepAlives: true,
                          addRepaintBoundaries: false,
                          itemBuilder: (context, index) {
                            return JobCard(
                              id: '1',
                              title: 'No Title',
                              company: 'No Location',
                              location: 'No Location',
                              salary: '10,000',
                              imageUrl: "https://miro.medium.com/v2/resize:fit:800/1*eYPD6Nie7QROiA6n0uPSTQ.png",
                              bookmarked: false,
                              jobType: "Remote",
                              // color: getColor(context,index)
                              // color: Color(0xC2232528)
                              color: Theme.of(context).colorScheme.background == Colors.black ? Color(0xC2232528) : Color(0xFFFAFAFA),
                            );
                          },
                        ),
                      );
                    }
                ),

                //List of Filters as Chips
                StreamBuilder<Map<String,bool>>(
                    stream: mapBloc.state,
                    initialData: filterList,
                    builder: (context, snapshot) {
                      return StreamBuilder<bool>(
                        stream: searchStartedBloc.state,
                        initialData: _searchStarted,
                        builder: (context, searchSnapshot) {
                          if(searchSnapshot.hasData && searchSnapshot.data!) {
                            if(searchSnapshot.data!){
                              return Container();
                            }
                            return Container(
                            height: 40,
                            margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemCount: snapshot.data!.keys.length,
                              separatorBuilder: (context, index) => SizedBox(
                                width: 10,
                              ),
                              itemBuilder: (context, index) {
                                String filterName = snapshot.data!.keys.toList()[index];
                                bool isSelected = snapshot.data!.values.toList()[index];
                                return FilterChip(
                                  label: Text(
                                      filterName
                                  ),
                                  selected: isSelected,
                                  elevation: 1,
                                  padding: const EdgeInsets.all(5),
                                  onSelected: (bool value) {
                                    jobBloc.filterJobs(snapshot.data!,filterName,!isSelected);
                                    mapBloc.setValue(snapshot.data!,filterName,!isSelected);
                                  },
                                );
                              },
                            ),
                          );
                          }
                          return Container();
                        }
                      );
                    }
                ),
                //Recommended For You
                if(!_searchStarted)
                  StreamBuilder<bool>(
                    stream: searchStartedBloc.state,
                    initialData: _searchStarted,
                    builder: (context, snapshot) {
                      bool searchStarted = snapshot.data!;
                      return Container(
                        margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              searchStarted?'Search Results':'Recommended For You',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            if(!searchStarted)
                            ElevatedButton(
                              onPressed: () {},
                              child: Text(
                                'View All',
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                  ),
                // set of tiles for recommended jobs
                StreamBuilder<bool>(
                  stream: searchStartedBloc.state,
                  initialData: _searchStarted,
                  builder: (context, snapshot) {
                    bool searchStarted = snapshot.data!;
                    return Container(
                        height: searchStarted?MediaQuery.of(context).size.height - 250: MediaQuery.of(context).size.height -600,
                        decoration: BoxDecoration(),
                        alignment: Alignment.center,
                        margin: const EdgeInsets.only(top: 10),
                        child: StreamBuilder<Response<Job>>(
                            stream: jobBloc.state,
                            builder: (context, jobSnapshot) {
                              if(jobSnapshot.hasData && jobSnapshot.data !=null && jobSnapshot.data!.status == Status.COMPLETED){
                                return ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  itemCount: jobSnapshot.data!.data!.data!.length,
                                  addAutomaticKeepAlives: true,
                                  addRepaintBoundaries: false,
                                  itemBuilder: (context, index) {
                                    Data job = jobSnapshot.data!.data!.data![index];
                                    String salary = double.parse((job.salaryRange!.low! + job.salaryRange!.high! / 2).toString()).toStringAsFixed(0);
                                    return JobTiles(
                                        title: job.title ?? 'No Title',
                                        company: job.company!.name ?? 'No Company',
                                        location: job.location ?? 'No Location',
                                        salary: salary,
                                        imageUrl: job.company!.logo ?? "https://miro.medium.com/v2/resize:fit:800/1*eYPD6Nie7QROiA6n0uPSTQ.png",
                                        bookmarked: false,
                                        jobType: job.jobType ?? "None",
                                        color: Theme.of(context).colorScheme.background == Colors.black ? Color(0xFF36454F) : Color(
                                            0xFFC2C2C2)
                                    );
                                  },
                                );
                              }
                              return Skeletonizer(
                                enabled: true,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 10,
                                  itemBuilder: (context, index) {
                                    return JobTiles(
                                        title: 'No Title',
                                        company: 'No Location',
                                        location: 'No Location',
                                        salary: '10,000',
                                        imageUrl: "https://miro.medium.com/v2/resize:fit:800/1*eYPD6Nie7QROiA6n0uPSTQ.png",
                                        bookmarked: false,
                                        jobType: "Remote",
                                        color: Theme.of(context).colorScheme.background == Colors.black ? Color(0xFF36454F) : Color(
                                            0xFFB2FFE2)
                                    );
                                  },
                                ),
                              );
                            }
                        )
                    );
                  }
                ),
              ],
            )),
      ),

    );
  }
}
