import 'dart:async';

import 'package:breakdown_assist/admin/admin_login.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState(){
    super.initState();
    Timer(Duration(seconds: 5),(){
      Navigator.pushReplacement(

        context,  MaterialPageRoute(builder: (context) => ADMIN_LOGIN()),
      );

    }
    );
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
            height: 300,
            width: 400,
            child: Lottie.asset("assets/anmie/Animes.json")),
      ),

    );
  }
}
