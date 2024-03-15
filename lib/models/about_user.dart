// class AboutUser {
//   String? name;
//   String? dob;
//   String? email;

//   AboutUser({this.name, this.dob, this.email});

//   AboutUser.fromJson(Map<String, dynamic> json) {
//     name = json['name'];
//     dob = json['dob'];
//     email = json['email'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['name'] = this.name;
//     data['dob'] = this.dob;
//     data['email'] = this.email;
//     return data;
//   }
//   List<String> toList() {
//     return [name!, email!, dob!];
//   }

//   AboutUser.fromList(List<String> list) {
//     name = list[0];
//     email = list[1];
//     dob = list[2];
   
//   }
// }