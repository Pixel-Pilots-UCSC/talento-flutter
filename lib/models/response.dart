

enum Status { LOADING, COMPLETED, ERROR }

class Response<T> {
  Status? status;
  T? data;
  String? message;

  Response.loading(this.message) : status = Status.LOADING;
  Response.completed(this.data) : status = Status.COMPLETED;
  Response.error(this.message) : status = Status.ERROR;

  Response.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'];
  }

  @override
  String toString() {
    return "Status : $status \n Message : $message \n Data : $data";
  }

}