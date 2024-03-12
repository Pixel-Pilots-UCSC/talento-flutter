import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:talento/bloc/list_bloc.dart';
import 'package:talento/bloc/ranger_bloc.dart';

import '../../bloc/string_bloc.dart';

class FilterView extends StatelessWidget {
  StringBloc industryBloc;
  StringBloc categoryBloc;
  StringBloc locationBloc;
  RangerBloc salaryBloc;
  ListBloc<String> jobTagsBloc;

  FilterView(
      {super.key,
      required this.industryBloc,
      required this.categoryBloc,
      required this.locationBloc,
      required this.jobTagsBloc,
        required this.salaryBloc
      });

  @override
  Widget build(BuildContext context) {
    // List of Search Filters as Industry Selection, Category Selection, Location Selection, Salary Range, Job Tags
    List<String> industry = [
      'IT',
      'Health',
      'Finance',
      'Education',
      'Engineering',
      'Hospitality',
      'Others'
    ];
    List<String> category = [
      'Full Time',
      'Part Time',
      'Contract',
      'Internship',
      'Freelance'
    ];
    List<String> location = [
      'Kathmandu',
      'Lalitpur',
      'Bhaktapur',
      'Pokhara',
      'Chitwan',
      'Biratnagar',
      'Others'
    ];
    List<String> jobTags = [
      'Remote',
      'Work From Home',
      'Onsite',
      'Flexible',
      'Part Time',
      'Full Time',
      'Contract',
      'Internship',
      'Freelance',
      'Temporary',
      'Permanent',
      'Others'
    ];

    TextEditingController industryController = TextEditingController();

    return Scaffold(
      appBar: AppBar(),
      drawerEnableOpenDragGesture: false,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Filter',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 26,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                // Industry Selection
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Industry',
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 16,
                            fontFamily: GoogleFonts.inter().fontFamily,
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 50,
                        child: TypeAheadField<String>(
                          controller: industryController,
                          suggestionsCallback: (search) async {
                            return industry
                                .where((element) => element
                                    .toLowerCase()
                                    .contains(search.toLowerCase()))
                                .toList();
                          },
                          builder: (context, controller, focusNode) {
                            return TextField(
                                controller: controller,
                                focusNode: focusNode,
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: 'Search Industry',
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                ));
                          },
                          itemBuilder: (context, city) {
                            return ListTile(
                              style: ListTileStyle.list,
                              dense: true,
                              tileColor: Theme.of(context).colorScheme.background,
                              title: Text(city),
                            );
                          },
                          onSelected: (city) {
                            industryController.text = city;
                            industryBloc.emit(city);
                          },
                          loadingBuilder: (context) {
                            return Container(
                              color: Theme.of(context).colorScheme.background,
                              height: 40,
                              child: Center(
                                child: CircularProgressIndicator(),
                              ),
                            );
                          },
                          debounceDuration: Duration(milliseconds: 500),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                // Category Selection
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Category',
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 16,
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 50,
                        child: TypeAheadField<String>(
                          suggestionsCallback: (search) async {
                            return category
                                .where((element) => element
                                    .toLowerCase()
                                    .contains(search.toLowerCase()))
                                .toList();
                          },
                          builder: (context, controller, focusNode) {
                            return TextField(
                                controller: controller,
                                focusNode: focusNode,
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: 'Search Category',
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                ));
                          },
                          itemBuilder: (context, city) {
                            return ListTile(
                              style: ListTileStyle.list,
                              dense: true,
                              tileColor: Theme.of(context).colorScheme.background,
                              title: Text(city),
                            );
                          },
                          onSelected: (city) {
                            categoryBloc.emit(city);
                          },
                          loadingBuilder: (context) {
                            return Container(
                              color: Theme.of(context).colorScheme.background,
                              height: 40,
                              child: Center(
                                child: CircularProgressIndicator(),
                              ),
                            );
                          },
                          debounceDuration: Duration(milliseconds: 500),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                // Location Selection
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Location',
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 16,
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 50,
                        child: TypeAheadField<String>(
                          suggestionsCallback: (search) async {
                            return location
                                .where((element) => element
                                    .toLowerCase()
                                    .contains(search.toLowerCase()))
                                .toList();
                          },
                          builder: (context, controller, focusNode) {
                            return TextField(
                                controller: controller,
                                focusNode: focusNode,
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: 'Search Location',
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                ));
                          },
                          itemBuilder: (context, city) {
                            return ListTile(
                              style: ListTileStyle.list,
                              dense: true,
                              tileColor: Theme.of(context).colorScheme.background,
                              title: Text(city),
                            );
                          },
                          onSelected: (city) {
                            locationBloc.emit(city);
                          },
                          loadingBuilder: (context) {
                            return Container(
                              color: Theme.of(context).colorScheme.background,
                              height: 40,
                              child: Center(
                                child: CircularProgressIndicator(),
                              ),
                            );
                          },
                          debounceDuration: Duration(milliseconds: 500),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                // Job Tags
                StreamBuilder<List<String>>(
                    stream: jobTagsBloc.state,
                    initialData: [],
                    builder: (context, snapshot) {
                      return Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Job Tags',
                                style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 16,
                                )),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 50,
                              child: TypeAheadField<String>(
                                suggestionsCallback: (search) async {
                                  return jobTags
                                      .where((element) => element
                                          .toLowerCase()
                                          .contains(search.toLowerCase()))
                                      .toList();
                                },
                                builder: (context, controller, focusNode) {
                                  return TextField(
                                      controller: controller,
                                      focusNode: focusNode,
                                      style: const TextStyle(
                                        fontSize: 12,
                                      ),
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText: 'Search Job Tags',
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 5),
                                      ));
                                },
                                itemBuilder: (context, city) {
                                  return ListTile(
                                    style: ListTileStyle.list,
                                    dense: true,
                                    tileColor:
                                        Theme.of(context).colorScheme.background,
                                    title: Text(city),
                                  );
                                },
                                onSelected: (city) {
                                  jobTagsBloc.add(city, snapshot.data!);
                                },
                                loadingBuilder: (context) {
                                  return Container(
                                    color: Theme.of(context).colorScheme.background,
                                    height: 40,
                                    child: Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                  );
                                },
                                debounceDuration: Duration(milliseconds: 500),
                              ),
                            ),
                            Wrap(
                              spacing: 5,
                              children: snapshot.data!
                                  .map((e) =>
                                  Chip(
                                    label: Text(e),
                                    labelStyle: TextStyle(
                                      color: Theme.of(context).colorScheme.background,
                                    ),
                                    side: BorderSide.none,
                                    color: MaterialStateProperty.all(Theme.of(context).primaryColor),
                                    deleteIcon: Icon(Icons.close, color: Theme.of(context).colorScheme.background, size: 20,),
                                    onDeleted: () {
                                      jobTagsBloc.remove(e, snapshot.data!);
                                    },
                                  )
                              )
                                  .toList(),
                            )
                          ],
                        ),
                      );
                    }),
                SizedBox(
                  height: 20,
                ),
                //Salary Range Selection using RangeSlider
                StreamBuilder<RangeValues>(
                  stream: salaryBloc.state,
                  builder: (context, salarySnapshot) {
                    return Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Salary Range',
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 16,
                              )),
                          SizedBox(
                            height: 10,
                          ),
                          RangeSlider(
                            values: salarySnapshot.data ?? RangeValues(0, 100000),
                            min: 0,
                            max: 100000,
                            divisions: 10,
                            labels: RangeLabels(
                              salarySnapshot.data?.start.toString() ?? '0',
                              salarySnapshot.data?.end.toString() ?? '100000',
                            ),
                            activeColor: Theme.of(context).primaryColor,
                            overlayColor: MaterialStateProperty.all(Theme.of(context).primaryColor.withOpacity(0.3)),
                            mouseCursor: MaterialStateMouseCursor.clickable,
                            onChanged: (RangeValues value) {
                              salaryBloc.emit(value);
                            },
                          )
                        ],
                      ),
                    );
                  }
                ),
                SizedBox(
                  height: 20,
                ),
                //Apply Filter Button
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Apply Filter'),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
