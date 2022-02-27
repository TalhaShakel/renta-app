import 'dart:convert';
import 'package:api_cache_manager/api_cache_manager.dart';
import 'package:api_cache_manager/models/cache_db_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:renta/pages/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/login_response_model.dart';

class SharedService {
  SharedService._();

  static final APICacheManager apiCacheManager = APICacheManager();

  static Future<bool> isLoggedIn() async {
    return (await SharedPreferences.getInstance()).containsKey('loginDetails');
  }

  static Future<LoginResponseModel?> loginDetails() async {
    var cacheData = (await SharedPreferences.getInstance()).get("loginDetails");
    print(cacheData);
    return loginResponseJson(cacheData.toString());
  }

  static Future<void> setLoginDetails(
    LoginResponseModel loginResponse,
  ) async {
    await (await SharedPreferences.getInstance()).setString(
      'loginDetails',
      jsonEncode(
        loginResponse.toJson(),
      ),
    );
    print(jsonEncode(loginResponse.toJson()));
    print((await SharedPreferences.getInstance()).get("loginDetails"));
  }

  static Future<void> logout(BuildContext context) async {
    await (await SharedPreferences.getInstance()).clear();
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => LoginPage()),
      (route) => false,
    );
  }
}
