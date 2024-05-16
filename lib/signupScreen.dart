import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_authentication_app/homeScreen.dart';
import 'package:firebase_authentication_app/loginScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'components/compCollections.dart';
import 'forget_password.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  SignUp(String email,String password) async {
    if(email == "" && password == ""){
      return UseAbleComp.customAlertBox(context, "please fill the fields before clicking on sign up Button");

    }else  if(email == "" || password == ""){
      return UseAbleComp.customAlertBox(context, "please fill both of the fields");

    }
    else{
      UserCredential? userCredential;
      try{
userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password).then((value) => Navigator.push(context, MaterialPageRoute(builder: (context)=> const HomeScreen())));
      }on FirebaseAuthException catch(ex){
        return UseAbleComp.customAlertBox(context, ex.code.toString());

      }
    }
  }






  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Stack(
          children: [

            Padding(
              padding: const EdgeInsets.only(top: 250.0),
              child: Container(

                  decoration:const BoxDecoration(
                    color: Colors.white,

                  ),
                  child:Column(

                    children: [
                      const SizedBox(height: 30,),
                      Container(
                        height: 200,
                        width: 200,
                        child: const Image(
                          fit: BoxFit.cover,
                          image: AssetImage(
                              "assets/images/ills1.png"
                          ),

                        ),
                      ),
                      const   SizedBox(height: 10,),
                      UseAbleComp.customTextFormField(
                          controller: emailController,
                          text: "Email",
                          iconData: Icons.email,
                          toHide: false),
                      UseAbleComp.customTextFormField(
                          controller: passwordController,
                          text: "Password",
                          iconData: Icons.lock,
                          toHide: true),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=> const ForgetScreen()));
                              },
                              child: const Text("Forgot Password?", style: TextStyle(
                                color: Color(0xff3E6DEC),
                                decoration: TextDecoration.underline,
                              ),),
                            )
                          ],
                        ),
                      ),


                      const  SizedBox(height: 30,),

                      UseAbleComp.customButton("Sign Up", () {
                        SignUp(emailController.text.toString(),passwordController.text.toString());
                      }),
                const  SizedBox(height: 10,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const  Text("Already have an account? "),
                            InkWell(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>const LoginScreen()));
                              },
                              child:const  Text("Login",style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xff3E6DEC),
                                  fontWeight: FontWeight.bold


                              ),),
                            ),
                          ],
                        ),
                      ),
                    ],


                  )

              ),
            ),
            Container(
              decoration:const  BoxDecoration(
                color:  Color(0xff3E6DEC),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(100),
                  bottomRight: Radius.circular(100),
                ),

              ),
              height: 255,
              width: double.infinity,

              child: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Sign Up",style: GoogleFonts.lilitaOne(
                      textStyle:const TextStyle(
                        fontSize: 70,
                        color: Colors.white,
                      ),
                    )),
                    Text(" Feel Free To Sign Up",style: GoogleFonts.aBeeZee(
                      textStyle:const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),),
                  ],
                ),
              ),

            ),
          ],
        ),
      )
    );
  }
}
