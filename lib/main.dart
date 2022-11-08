import 'package:flutter/material.dart';
import 'package:tradeswap_front/pages/home/homepage.dart';
import 'package:tradeswap_front/pages/searchresults/searchresults.dart';
import 'pages/startup.dart';
import 'pages/client/client_signup.dart';
import 'pages/tradesman/tradesman_signup.dart';
import 'pages/signup.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: LandingScreen()
    );
  }
}
