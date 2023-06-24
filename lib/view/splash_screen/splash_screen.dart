import 'dart:async';

import 'package:flutter/material.dart';

import '../landing_screen/landing_screen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() =>SplashScreenState();
}
class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3),
    ()=>Navigator.pushReplacement(context,MaterialPageRoute(builder:(context) => const LandingScreen())));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: const Color(0xffF2EEE4),
      body: Image.asset("assets/images/splash.png",height: MediaQuery.of(context).size.height,)

    );
  }
}