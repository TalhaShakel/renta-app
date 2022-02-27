class RegisterRequestModel {
  RegisterRequestModel({
    this.fullname,
    this.username,
    this.phonenumber,
    this.email,
    this.password,
    this.confirmPassword,
  });
  late final String? fullname;
  late final String? username;
  late final String? phonenumber;
  late final String? password;
  late final String? email;
  late final String? confirmPassword;
  var role = 'buyer';

  RegisterRequestModel.fromJson(Map<String, dynamic> json) {
    fullname = json['fullName'];
    username = json['username'];
    phonenumber = json['phoneNumber'];
    email = json['email'];
    password = json['password'];

    confirmPassword = json['confirmPassword'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['fullName'] = fullname;
    _data['username'] = username;
    _data['phoneNumber'] = phonenumber;
    _data['email'] = email;
    _data['password'] = password;
    _data['role'] = 'buyer';
    _data['confirmPassword'] = confirmPassword;
    return _data;
  }
}
