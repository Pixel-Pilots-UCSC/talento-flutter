class Job {
  String? status;
  List<Data>? data;

  Job({this.status, this.data});

  Job.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  Company? company;
  SalaryRange? salaryRange;
  String? sId;
  String? title;
  String? description;
  String? jobType;
  List<String>? requirements;
  List<String>? responsibilities;
  String? location;
  Employer? employer;
  int? iV;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.company,
        this.salaryRange,
        this.sId,
        this.title,
        this.description,
        this.jobType,
        this.requirements,
        this.responsibilities,
        this.location,
        this.employer,
        this.iV,
        this.createdAt,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    company =
    json['company'] != null ? new Company.fromJson(json['company']) : null;
    salaryRange = json['salaryRange'] != null
        ? new SalaryRange.fromJson(json['salaryRange'])
        : null;
    sId = json['_id'];
    title = json['title'];
    description = json['description'];
    jobType = json['jobType'];
    requirements = json['requirements'].cast<String>();
    responsibilities = json['responsibilities'].cast<String>();
    location = json['location'];
    employer = json['employer'] != null
        ? new Employer.fromJson(json['employer'])
        : null;
    iV = json['__v'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.company != null) {
      data['company'] = this.company!.toJson();
    }
    if (this.salaryRange != null) {
      data['salaryRange'] = this.salaryRange!.toJson();
    }
    data['_id'] = this.sId;
    data['title'] = this.title;
    data['description'] = this.description;
    data['jobType'] = this.jobType;
    data['requirements'] = this.requirements;
    data['responsibilities'] = this.responsibilities;
    data['location'] = this.location;
    if (this.employer != null) {
      data['employer'] = this.employer!.toJson();
    }
    data['__v'] = this.iV;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

class Company {
  String? name;
  String? logo;

  Company({this.name, this.logo});

  Company.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    logo = json['logo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['logo'] = this.logo;
    return data;
  }
}

class SalaryRange {
  double? low;
  double? high;
  String? currency;

  SalaryRange({this.low, this.high, this.currency});

  SalaryRange.fromJson(Map<String, dynamic> json) {
    low = json['low'];
    high = json['high'];
    currency = json['currency'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['low'] = this.low;
    data['high'] = this.high;
    data['currency'] = this.currency;
    return data;
  }
}

class Employer {
  String? sId;
  String? email;
  String? image;

  Employer({this.sId, this.email, this.image});

  Employer.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    email = json['email'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['email'] = this.email;
    data['image'] = this.image;
    return data;
  }
}
