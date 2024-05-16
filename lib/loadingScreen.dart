import 'dart:async';
import 'package:firebase_authentication_app/loginScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';


class LoadingScreen extends StatefulWidget {

  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.push(context, MaterialPageRoute(builder: (context)=> const  LoginScreen()));
    });
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor: const Color(0xff3E6DEC),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Container(
                child:   const SpinKitWaveSpinner(
                  color: Colors.white,
                trackColor: Colors.white,
                waveColor: Colors.white,
                  size: 150.0,
                  duration: Duration(seconds: 3),
          
                ),
          
              ),


            ],
          ),
        )
      );
  }
}
