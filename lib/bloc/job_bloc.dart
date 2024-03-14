

import 'package:talento/core/base_bloc.dart';
import 'package:talento/models/job_model.dart';
import 'package:talento/networking/api_provider.dart';

import '../models/response.dart';

class JobBloc extends BaseBloc<Response<Job>>{


  void getJobs() async {
    emit(Response.loading(''));
    try{
      var response = await APIProvider.get('/job/all', null);
      Job jobs = Job.fromJson(response as Map<String, dynamic>);
      print(jobs);
      emit(Response.completed(jobs));
    }catch(e){
      print(e);
      emit(Response.error(e.toString()));
    }
  }



  JobBloc(){
    getJobs();

  }

  void filterJobs(Map<String, bool> map, String filterName, bool bool) async{
    map[filterName] = bool;
    emit(Response.loading(''));
    try{
      var response =await APIProvider.get('/job/all', null);
      Job jobs = Job.fromJson(response as Map<String, dynamic>);
      List<String> selectedKeys = map.keys.where((element) => map[element] ==true).toList();
      if(selectedKeys.isNotEmpty) {
        List<Data> filteredJobs = jobs.data!.where((element) {
          for (var key in selectedKeys) {
            if (element.jobType == key) {
              return true;
            }
          }
          return false;
        }).toList();
        jobs.data = filteredJobs;
      }

      emit(Response.completed(jobs));
    }catch(e){
      print(e);
      emit(Response.error(e.toString()));
    }

  }

  void searchJobs(String value) async{
    emit(Response.loading(''));
    try{
      var response = await APIProvider.get('/job/search/title', null, queryParameters: {'search': value});
      Job jobs = Job.fromJson(response as Map<String, dynamic>);
      emit(Response.completed(jobs));
    }catch(e){
      print(e);
      emit(Response.error(e.toString()));
    }
  }
}