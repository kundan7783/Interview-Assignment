import 'package:flutter/material.dart';
import 'package:interview_assignment/provider/auth_provider.dart';
import 'package:interview_assignment/provider/notification_list_provider.dart';
import 'package:interview_assignment/screens/splash_screen.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => AuthProvider()),
          ChangeNotifierProvider(create: (context) => NotificationListProvider(),)
        ],
        child: MyApp(),
      )
  );

}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
