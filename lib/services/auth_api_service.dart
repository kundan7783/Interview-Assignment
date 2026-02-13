import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:interview_assignment/constant/api_url.dart';
import 'package:interview_assignment/models/login_request_model.dart';
import 'package:interview_assignment/models/login_response_model.dart';
import 'package:interview_assignment/models/register_request_model.dart';
import 'package:interview_assignment/models/register_response_model.dart';
class AuthApiService {

  static Future<RegisterResponseModel?> registerApiService(RegisterRequestModel user) async {
    try{
      var response = await http.post(
          Uri.parse("$apiUrl/api/user-register"),
          headers: {"Content-Type" : "application/json"},
          body: jsonEncode(user.toJson())
      );
      if(response.statusCode == 200 || response.statusCode == 201){
        var body = jsonDecode(response.body);
        return RegisterResponseModel.fromJson(body);
      }
    }catch(error){
      print("Register Error : $error");
    }
    return null;
  }

  static Future<LoginResponseModel?> loginApiService(LoginRequestModel user) async {
    try{
      var response = await http.post(
          Uri.parse("$apiUrl/api/user-login"),
          headers: {"Content-Type" : "application/json"},
          body: jsonEncode(user.toJson())
      );
      if(response.statusCode == 200 || response.statusCode == 201){
        var body = jsonDecode(response.body);
        return LoginResponseModel.fromJson(body);
      }

    }catch(error){
      print("Login Error : $error");
    }
    return null;
  }
}