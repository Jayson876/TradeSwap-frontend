import 'package:flutter/material.dart';
import 'package:tradeswap_front/pages/home/homepage.dart';
import 'package:tradeswap_front/pages/searchresults/searchresults.dart';
import 'pages/startup.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) 
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: LandingScreen()
    );
    return const MaterialApp(home: LandingScreen());
  }
}
