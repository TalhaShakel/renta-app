import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AuthService {
  Dio dio = Dio();
  login(email, password) async {
    try {
      return await dio.post(
          'https://rentacar1311.azurewebsites.net/api/v1/login',
          data: {
            "email": email,
            "password": password,
          },
          options: Options(contentType: Headers.formUrlEncodedContentType));
    } on DioError catch (e) {
      Fluttertoast.showToast(
          msg: e.response?.data['msg'],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 5,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  registerUser(
    fullname,
    username,
    email,
    phoneNumber,
    password,
    confirmPassword,
  ) async {
    return await dio.post(
        'https://rentacar1311.azurewebsites.net/api/v1/signup',
        data: {
          "fullname": fullname,
          "username": username,
          "phoneNumber": phoneNumber,
          "email": email,
          "password": password,
          "confirmPassword": confirmPassword
        },
        options: Options(contentType: Headers.formUrlEncodedContentType));
  }
}
