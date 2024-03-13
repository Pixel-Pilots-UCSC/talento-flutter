import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:talento/bloc/boolean_bloc.dart';
import 'package:talento/bloc/job_bloc.dart';

class Skills extends StatelessWidget {
  Skills({super.key});
  final TextEditingController _controller = TextEditingController();
   BooleanBloc searchStartedBloc = BooleanBloc();
  TextEditingController searchController = TextEditingController();
   JobBloc jobBloc = JobBloc();
  JobBloc newJobBloc = JobBloc();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.black,
          backgroundColor: Colors.transparent,
        ),
        body: Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
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
        ),
      ),
    );
  }
}
