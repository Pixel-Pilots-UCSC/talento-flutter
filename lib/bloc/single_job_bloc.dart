

import 'package:talento/core/base_bloc.dart';
import 'package:talento/models/job_model.dart';
import 'package:talento/models/single_job.dart';
import 'package:talento/networking/api_provider.dart';

import '../core/broadcast_base_bloc.dart';
import '../models/response.dart';

class SingleJobBloc extends BaseBloc<Response<SingleJob>>{



  getJobDetail(String jobId) async {
    emit(Response.loading(''));
    try{
      var response = await APIProvider.get('/job/$jobId', null);
      SingleJob jobs = SingleJob.fromJson(response as Map<String, dynamic>);
      emit(Response.completed(jobs));
    }catch(e){
      print(e);
      emit(Response.error(e.toString()));
    }
  }


}