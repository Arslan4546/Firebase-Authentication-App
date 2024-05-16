import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_authentication_app/loginScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


import 'homeScreen.dart';


class LoadingScreen extends StatefulWidget {

  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  Future checkUser() async {

    final user = FirebaseAuth.instance.currentUser;

    if(user != null){

      Timer(const Duration(seconds: 5), () {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const HomeScreen()));

      });
    }else{

      Timer(const Duration(seconds: 5), () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=> const LoginScreen()));

      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkUser();
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
