import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
void main() async{

WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const LoadingScreen());
}

class LoadingScreen extends StatefulWidget {

  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {




  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:  Scaffold(
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
             const  SizedBox(height: 30,),
              Text("Greetings",
                textAlign :TextAlign.center,style:GoogleFonts.lilitaOne(
                  textStyle:const  TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
          
                  )
                ),),

            ],
          ),
        )
      ),
    );
  }
}
