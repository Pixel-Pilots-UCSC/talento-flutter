import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:math' as math;
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:talento/bloc/map_bloc.dart';
import 'package:talento/models/response.dart';

import '../../models/job_model.dart';
import '../../widgets/job_card.dart';
import '../../widgets/job_tiles.dart';

class DashboardView extends StatelessWidget {
  DashboardView({super.key});
  final _scaffoldKey = GlobalKey<ScaffoldState>();

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
    Color(0xFF000080),
    Color(0xFF006400),
    Color(0xFF800000),
    Color(0xFF4B0082),
    Color(0xFF00008B),
    Color(0xFFD2691E),
    Color(0xFF36454F),
    Color(0xFF228B22),
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


  List<Job> jobList = [
    Job(
      title: 'Software Engineer',
      company: 'Google',
      location: 'Remote',
      salary: '100,000',
      imageUrl:
          'https://www.shutterstock.com/image-vector/luxury-building-construction-company-logo-260nw-1383756005.jpg',
      jobType: 'Full Time',
    ),
    Job(
      title: 'Software Engineer',
      company: 'Google',
      location: 'Remote',
      salary: '100,000',
      imageUrl:
          'https://miro.medium.com/v2/resize:fit:860/1*ByoJvUAuB0L00yk1UhkEiw.png',
      jobType: 'Full Time',
    ),
    Job(
      title: 'Software Engineer',
      company: 'Google',
      location: 'Remote',
      salary: '100,000',
      imageUrl:
          'https://www.shutterstock.com/image-vector/luxury-building-construction-company-logo-260nw-1383756005.jpg',
      jobType: 'Full Time',
    ),
    Job(
      title: 'Software Engineer',
      company: 'Google',
      location: 'Remote',
      salary: '100,000',
      imageUrl:
          'https://www.shutterstock.com/image-vector/luxury-building-construction-company-logo-260nw-1383756005.jpg',
      jobType: 'Full Time',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawerEnableOpenDragGesture: false,
      appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              _scaffoldKey.currentState?.openDrawer();
            },
            icon: const Icon(Icons.menu),
          ),
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
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(0.5),
            child: Container(
              height: 0.1,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFF303C4E),
                    spreadRadius: 0.2,
                    blurRadius: 0.2,
                    offset: Offset(0, 1),
                  ),
                ],
                color: Color(0xFF303C4E),
              )
            ),
          )
      ),
      body: Container(
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
                    height: 40,
                    padding: const EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: 'Search',
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.black,
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

                      ),
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
                    onPressed: () {},
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
          Container(
            height: 300,
            decoration: BoxDecoration(),
            alignment: Alignment.center,
            margin: const EdgeInsets.only(top: 10),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: jobList.length,
              addAutomaticKeepAlives: true,
              addRepaintBoundaries: false,
              itemBuilder: (context, index) {
                Job job = jobList[index];
                return JobCard(
                    title: job.title,
                    company: job.company,
                    location: job.location,
                    salary: job.salary,
                    imageUrl: job.imageUrl,
                    bookmarked: job.bookmarked,
                    jobType: job.jobType,
                    color: getColor(context,index)
                );
              },
            ),
          ),
          //List of Filters as Chips
          StreamBuilder<Map<String,bool>>(
            stream: mapBloc.state,
            initialData: filterList,
            builder: (context, snapshot) {
                return Skeletonizer(
                  enabled: snapshot.connectionState == ConnectionState.done,
                  child: Container(
                    height: 40,
                    margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data!.keys.length,
                      itemBuilder: (context, index) {
                        String filterName = snapshot.data!.keys.toList()[index];
                        bool isSelected = snapshot.data!.values.toList()[index];
                        return GestureDetector(
                          onTap: (){
                            mapBloc.setValue(snapshot.data!,filterName,!isSelected);
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 30,
                            margin: const EdgeInsets.only(right: 5),
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            decoration: BoxDecoration(
                              color: isSelected ? Color(0xFF3EB489) : Colors.grey,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                if(isSelected)
                                  Icon(
                                    FeatherIcons.check,
                                    color: Colors.white,
                                    size: 15,
                                  ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  filterName,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                ),
                  
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                );

            }
          ),
          //Recommended For You
          Container(
            margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Recommended For You',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'View All',
                    style: TextStyle(
                      color: Color(0xFF3EB489),
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
          //set of tiles for recommended jobs
          Container(
            height: MediaQuery.of(context).size.height -600,
            decoration: BoxDecoration(),
            alignment: Alignment.center,
            margin: const EdgeInsets.only(top: 10),
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: jobList.length,
              itemBuilder: (context, index) {
                Job job = jobList[index];
                return JobTiles(
                    title: job.title,
                    company: job.company,
                    location: job.location,
                    salary: job.salary,
                    imageUrl: job.imageUrl,
                    bookmarked: job.bookmarked,
                    jobType: job.jobType,
                    color: getColor(context,index)
                );
              },
            ),
          ),
        ],
      )),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFF3EB489),
              ),
              child: Text(
                'Drawer Header',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: Text('Item 1'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Item 2'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
