import 'package:flutter/material.dart';
import 'package:interview_assignment/screens/dealer_notification_list_screen.dart';
import 'package:interview_assignment/screens/login_screen.dart';

import '../utils/token_storage_service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      checkLogin();
    });
  }

  void checkLogin() async {
    String? token = await TokenStorageService.getToken();
    if (token != null && token.isNotEmpty) {
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => DealerNotificationListScreen(),), (route) => false,);
    } else {
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => LoginScreen(),), (route) => false,);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1A4B3C),
      body: Center(
        child: Text(
          "Krishi",
          style: TextStyle(
            fontSize: 42,
            fontWeight: FontWeight.w700,
            letterSpacing: 2,
            color: Colors.white,
            shadows: [
              Shadow(
                offset: Offset(2, 2),
                blurRadius: 6,
                color: Colors.black26,
              )
            ],
          ),
        ),
      ),
    );
  }
}