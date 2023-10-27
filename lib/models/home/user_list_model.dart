class UserListModel {
  Map? status;
  Map? data;

  UserListModel({this.data});

  UserListModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['data'] = this.data;

    return data;
  }
}

class Data {
  int? id;
  String? email;
  String? firstName;
  String? lastName;

  Data({
    this.id,
    this.email,
    this.firstName,
    this.lastName,
  });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    firstName = json['first_name'];
    lastName = json['last_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    return data;
  }
}
