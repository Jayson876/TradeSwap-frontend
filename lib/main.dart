import 'package:flutter/material.dart';
import 'pages/startup.dart';
import 'pages/client/client_signup.dart';
import 'pages/tradesman/tradesman_signup.dart';
import 'pages/signup.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LandingScreen(),
    );
  }
}
