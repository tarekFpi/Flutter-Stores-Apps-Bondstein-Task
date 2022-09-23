import 'dart:async';
import 'package:dondstein/View/Home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:lottie/lottie.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    loadData();

  }

  void loadData()async{

    setState(() {

       Timer(Duration(seconds: 4), () {
          Navigator.pushReplacement(
              context, CupertinoPageRoute(builder: (context) => HomePagae()));
        });

    });

  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
//AnimatedSplashScreen
    return SafeArea(
        child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.tealAccent, Colors.orange])),
          child: Scaffold(
      body:  Column(
       mainAxisAlignment: MainAxisAlignment.spaceAround,

          children: [
             SizedBox(
                height: height*0.10,
              ),
            Align(
              alignment: Alignment.topCenter,
              child: Text(
                "Welcome To Bondstein Apps",
                style: TextStyle(fontSize: 22, color: Colors.teal),
              ),
            ),

            Expanded(
              child: Align(
                alignment: Alignment.center,
                  child: Lottie.asset("assets/animation/money.json")),
            )

          ],
      ),
    ),
        ));
  }
}
