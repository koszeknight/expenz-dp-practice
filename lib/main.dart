import 'package:expenz/screens/onboard_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Expenz",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Inter",
      ),

      home: OnboardingScreen(),
      // home: Scaffold(
      //   body: Center(
      //     child: Text(
      //       "Hello Flutter",
      //       style: TextStyle(fontSize: 20),
      //     ),
      //   ),
      // ),
    );
  }
}
