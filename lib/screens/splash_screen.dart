import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:miniproject/main.dart';
import 'package:miniproject/screens/login_page.dart';
class splash_scrn extends StatefulWidget {
  const splash_scrn({super.key});

  @override
  State<splash_scrn> createState() => _splash_scrnState();
}

class _splash_scrnState extends State<splash_scrn> {
  @override
  void initState(){
    super.initState();
    Timer(Duration(seconds: 5),(){
      Navigator.pushReplacement(

        context,  MaterialPageRoute(builder: (context) => login()),
      );
    }
    );
  }



  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Lottie.asset("assets/images/cart1.json")
      )

    );
  }
}
