class AuthUser {
  String? id;
  String? email;
  String? image;
  String? role;
  String? token;

  AuthUser({this.id, this.email, this.image, this.role, this.token});

  AuthUser.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    image = json['image'];
    role = json['role'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['image'] = this.image;
    data['role'] = this.role;
    data['token'] = this.token;
    return data;
  }

  List<String> toList() {
    return [id!, email!, image!, role!, token!];
  }

  AuthUser.fromList(List<String> list) {
    id = list[0];
    email = list[1];
    image = list[2];
    role = list[3];
    token = list[4];
  }
}
