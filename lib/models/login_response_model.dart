import 'dart:convert';

LoginResponseModel loginResponseJson(String str) =>
    LoginResponseModel.fromJson(json.decode(str));

class LoginResponseModel {
  LoginResponseModel({
    required this.message,
    required this.data,
  });
  late final String message;
  late final Data data;

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    message = json['status'];
    data = Data.fromJson(json['data']['user']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = message;
    _data['data'] = data.toJson();
    return _data;
  }
}

class Data {
  Data({
    required this.username,
    required this.email,
    required this.date,
    required this.id,
    required this.token,
  });
  late final String username;
  late final String email;
  late final String date;
  late final String id;
  late final String token;
  late final String fullName;
  late final String userId;
  late final String phoneNumber;

  Data.fromJson(Map<String, dynamic> json) {
    username = json['username'] ?? '';
    email = json['email'] ?? '';
    // date = json['date'];
    id = json['_id'] ?? '';
    // token = json['token'];
    fullName = json['fullName'] ?? '';
    userId = json['userId'] ?? '';
    phoneNumber = json['phoneNumber'].toString();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    final ret = <String, dynamic>{};
    _data['username'] = username;
    _data['email'] = email;
    // _data['date'] = date;
    _data['_id'] = id;
    // _data['token'] = token;
    _data['fullName'] = fullName;
    _data['userId'] = userId;
    _data['phoneNumber'] = phoneNumber;
    ret['user'] = <String, dynamic>{..._data};
    return ret;
  }
}
