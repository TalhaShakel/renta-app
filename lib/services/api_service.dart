import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/login_request_model.dart';
import '../models/login_response_model.dart';
import '../models/register_request_model.dart';
import '../models/register_response_model.dart';
import '../utils/config.dart';
import 'shared_service.dart';

class APIService {
  static var client = http.Client();

  static Future<dynamic> login(
    LoginRequestModel model,
  ) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var url = Uri.http(
      Config.apiURL,
      Config.loginAPI,
    );

    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode(model.toJson()),
    );

    print(response.body);
    print(response.statusCode);
    print(response.reasonPhrase);

    if (response.statusCode == 200) {
      await SharedService.setLoginDetails(
        loginResponseJson(
          response.body,
        ),
      );

      return true;
    } else {
      return response.reasonPhrase;
    }
  }

  static Future<http.Response> fetchCars() async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var url = Uri.http(
      Config.apiURL,
      Config.carsFetchAPI,
    );

    var response = await client.get(
      url,
      headers: requestHeaders,
    );

    // print(response.body);
    // print(response.statusCode);
    // print(response.reasonPhrase);

    return response;
  }

  static Future<dynamic> register(
    RegisterRequestModel model,
  ) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var url = Uri.http(
      Config.apiURL,
      Config.registerAPI,
    );

    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode(model.toJson()),
    );

    print(response.body);
    print(response.statusCode);
    print(response.reasonPhrase);

    if (response.statusCode == 200) {
      return registerResponseJson(
        response.body,
      );
    } else {
      return response.reasonPhrase;
    }
  }

  // static Future<String> getUserProfile() async {
  //   var loginDetails = await SharedService.loginDetails();

  //   Map<String, String> requestHeaders = {
  //     'Content-Type': 'application/json',
  //     'Authorization': 'Basic ${loginDetails!.data.token}'
  //   };

  // // //var url = Uri.http(Config.apiURL, Config.userProfileAPI);

  // // var response = await client.get(
  // //   url,
  // //   headers: requestHeaders,
  // // );

  // if (response.statusCode == 200) {
  //   return response.body;
  // } else {
  //   return "";
  // }

}
