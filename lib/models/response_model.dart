

enum Status { LOADING, COMPLETED, ERROR }

class ResponseModel<T> {
  String? status;
  T? data;
  String? message;


  ResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'];
  }

  @override
  String toString() {
    return "Status : $status \n Message : $message \n Data : $data";
  }

}