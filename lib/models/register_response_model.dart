import 'dart:convert';

RegisterResponseModel registerResponseJson(String str) =>
    RegisterResponseModel.fromJson(json.decode(str));

class RegisterResponseModel {
  RegisterResponseModel({
    required this.message,
    required this.data,
  });
  late final String message;
  late final Data? data;

  RegisterResponseModel.fromJson(Map<String, dynamic> json) {
    message = json['status'] ?? '';
    data = json['data'] != null ? Data.fromJson(json['data']['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['message'] = message;
    _data['data'] = data!.toJson();
    return _data;
  }
}

class Data {
  Data({
    required this.fullname,
    required this.email,
    required this.username,
    required this.phonenumber,
    required this.password,
    required this.date,
    required this.id,
    required this.userId,
  });
  late final String username;
  late final String email;
  late final String fullname;
  late final String phonenumber;
  late final String password;
  late final String date;
  late final String id;
  late final String userId;
  late final String role;

  Data.fromJson(Map<String, dynamic> json) {
    fullname = json['fullName'] ?? '';
    userId = json['userId'] ?? '';
    username = json['username'];
    email = json['email'];
    phonenumber = json['phoneNumber'].toString();
    // date = json['date'];
    id = json['_id'];
    role = 'buyer';
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['username'] = username;
    _data['email'] = email;
    _data['fullName'] = fullname;
    _data['phoneNumber'] = phonenumber;
    _data['password'] = password;
    _data['date'] = date;
    _data['id'] = id;
    _data['userId'] = userId;
    _data['role'] = 'buyer';
    return _data;
  }
}
