class UserModel {
  String? status;
  Data? data;

  UserModel({this.status, this.data});

  UserModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  Profile? profile;
  String? sId;
  String? email;
  String? role;
  String? image;
  int? iV;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.profile,
        this.sId,
        this.email,
        this.role,
        this.image,
        this.iV,
        this.createdAt,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    profile =
    json['profile'] != null ? new Profile.fromJson(json['profile']) : null;
    sId = json['_id'];
    email = json['email'];
    role = json['role'];
    image = json['image'];
    iV = json['__v'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.profile != null) {
      data['profile'] = this.profile!.toJson();
    }
    data['_id'] = this.sId;
    data['email'] = this.email;
    data['role'] = this.role;
    data['image'] = this.image;
    data['__v'] = this.iV;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

class Profile {
  String? name;
  String? dob;
  String? contact;
  List<String>? socialLinks;
  List<String>? skills;
  List<Qualifications>? qualifications;
  List<WorkExperience>? workExperience;
  List<Education>? education;

  Profile(
      {this.name,
        this.dob,
        this.contact,
        this.socialLinks,
        this.skills,
        this.qualifications,
        this.workExperience,
        this.education});

  Profile.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    dob = json['dob'];
    contact = json['contact'];
    socialLinks = json['socialLinks'].cast<String>();
    skills = json['skills'].cast<String>();
    if (json['qualifications'] != null) {
      qualifications = <Qualifications>[];
      json['qualifications'].forEach((v) {
        qualifications!.add(new Qualifications.fromJson(v));
      });
    }
    if (json['workExperience'] != null) {
      workExperience = <WorkExperience>[];
      json['workExperience'].forEach((v) {
        workExperience!.add(new WorkExperience.fromJson(v));
      });
    }
    if (json['education'] != null) {
      education = <Education>[];
      json['education'].forEach((v) {
        education!.add(new Education.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['dob'] = this.dob;
    data['contact'] = this.contact;
    data['socialLinks'] = this.socialLinks;
    data['skills'] = this.skills;
    if (this.qualifications != null) {
      data['qualifications'] =
          this.qualifications!.map((v) => v.toJson()).toList();
    }
    if (this.workExperience != null) {
      data['workExperience'] =
          this.workExperience!.map((v) => v.toJson()).toList();
    }
    if (this.education != null) {
      data['education'] = this.education!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Qualifications {
  String? qualification;
  String? date;
  String? description;
  String? sId;

  Qualifications({this.qualification, this.date, this.description, this.sId});

  Qualifications.fromJson(Map<String, dynamic> json) {
    qualification = json['qualification'];
    date = json['date'];
    description = json['description'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['qualification'] = this.qualification;
    data['date'] = this.date;
    data['description'] = this.description;
    data['_id'] = this.sId;
    return data;
  }
}

class WorkExperience {
  String? position;
  String? company;
  String? startDate;
  String? endDate;
  bool? isCurrent;
  String? description;
  String? sId;

  WorkExperience(
      {this.position,
        this.company,
        this.startDate,
        this.endDate,
        this.isCurrent,
        this.description,
        this.sId});

  WorkExperience.fromJson(Map<String, dynamic> json) {
    position = json['position'];
    company = json['company'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    isCurrent = json['isCurrent'];
    description = json['description'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['position'] = this.position;
    data['company'] = this.company;
    data['startDate'] = this.startDate;
    data['endDate'] = this.endDate;
    data['isCurrent'] = this.isCurrent;
    data['description'] = this.description;
    data['_id'] = this.sId;
    return data;
  }
}

class Education {
  String? institution;
  String? degree;
  String? field;
  String? startDate;
  String? endDate;
  String? description;
  String? sId;

  Education(
      {this.institution,
        this.degree,
        this.field,
        this.startDate,
        this.endDate,
        this.description,
        this.sId});

  Education.fromJson(Map<String, dynamic> json) {
    institution = json['institution'];
    degree = json['degree'];
    field = json['field'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    description = json['description'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['institution'] = this.institution;
    data['degree'] = this.degree;
    data['field'] = this.field;
    data['startDate'] = this.startDate;
    data['endDate'] = this.endDate;
    data['description'] = this.description;
    data['_id'] = this.sId;
    return data;
  }
}
