import 'package:flutter/material.dart';
import 'package:interview_assignment/models/login_request_model.dart';
import 'package:interview_assignment/models/register_request_model.dart';
import 'package:interview_assignment/screens/dealer_notification_list_screen.dart';
import 'package:interview_assignment/screens/login_screen.dart';
import 'package:interview_assignment/services/auth_api_service.dart';

import '../utils/token_storage_service.dart';

class AuthProvider extends ChangeNotifier {
  TextEditingController nameEditingController = TextEditingController();
  TextEditingController emailEditingController = TextEditingController();
  TextEditingController genderEditingController = TextEditingController();
  TextEditingController phoneEditingController = TextEditingController();
  TextEditingController passwordEditingController = TextEditingController();

  TextEditingController emailLoginEditingController = TextEditingController();
  TextEditingController passwordLoginEditingController = TextEditingController();


  final registerKey = GlobalKey<FormState>();
  final loginKey = GlobalKey<FormState>();
  bool isSignupLoading = false;
  bool isLoginLoading = false;


  Future<void> registerUserProvider(BuildContext context, RegisterRequestModel request,) async {
    isSignupLoading = true;
    notifyListeners();

    final response = await AuthApiService.registerApiService(request);

    isSignupLoading = false;
    notifyListeners();

    if (response != null && response.success == true) {

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(response.message)),
      );
      Navigator.pop(context);

    }
    else {
      ScaffoldMessenger.of(context).showSnackBar(
         SnackBar(content: Text(response?.message ??  "Register Faield!")),
      );
    }
  }



  Future<void> loginUserProvider(BuildContext context, LoginRequestModel request,) async {

    isLoginLoading = true;
    notifyListeners();

    final response = await AuthApiService.loginApiService(request);

    isLoginLoading = false;
    notifyListeners();

    if (response != null && response.success == true) {

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(response.message)),
      );
      await TokenStorageService.saveToken(
        response.data.accessToken,
      );

      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => DealerNotificationListScreen(),));


    } else {
      ScaffoldMessenger.of(context).showSnackBar(
         SnackBar(content: Text(response?.message ?? "Login Faield")),
      );
    }
  }
}
