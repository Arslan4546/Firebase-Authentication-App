import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_authentication_app/loginScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  LogOut()async{
    FirebaseAuth.instance.signOut().then((value) => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const LoginScreen())));

  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        iconTheme:  const IconThemeData(color: Colors.white),
        backgroundColor: const Color(0xff3E6DEC),
        title:  Text("Home Screen",style: GoogleFonts.lilitaOne(
          textStyle:const TextStyle(
            color: Colors.white
          )
        ),),
        centerTitle: true,
        actions:
        [
          IconButton(onPressed: (){
            LogOut();
          }, icon: const Icon(Icons.logout,size: 30,)),
          SizedBox(width: 10,),
        ],
      ),

    );
  }
}
