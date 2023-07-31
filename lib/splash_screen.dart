import 'dart:async';

import 'package:encryptedcloudstorage/login.dart';
import 'package:flutter/material.dart';
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
    Timer(Duration(seconds: 4),(){
      Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginScreen()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            gradient:LinearGradient(
                begin: Alignment.topCenter,
                colors: [
                  Colors.blue.shade900,
                  Colors.blue.shade800,

                ]
            ),
          ),
          child: Center(
            child: Container(
              padding: EdgeInsets.all(15),
              height: 250,
              width: MediaQuery.of(context).size.width,

              child:   const Center(
                child: Image(image: AssetImage("images/logo.png"),),
              ),

            ),
          ),
        ),);
  }
}
