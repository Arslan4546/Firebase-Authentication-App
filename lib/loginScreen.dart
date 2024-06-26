import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_authentication_app/forget_password.dart';
import 'package:firebase_authentication_app/signupScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'components/compCollections.dart';
import 'homeScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  SignIn(String email,String password) async {
    if(email == "" && password == ""){
      return UseAbleComp.customAlertBox(context, "please fill the fields before clicking on Login Button");

    }else  if(email == "" || password == ""){
      return UseAbleComp.customAlertBox(context, "please fill both of the fields");

    }

    else{
      UserCredential? userCredential;
      try{
        userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password).then((value) => Navigator.push(context, MaterialPageRoute(builder: (context)=> const HomeScreen())));
      }on FirebaseAuthException catch(ex){
        return UseAbleComp.customAlertBox(context, ex.code.toString());

      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Stack(
          children: [
            Container(
              height: 350,
              width: double.infinity,
              color:const  Color(0xff3E6DEC),
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0,top: 80),
                child: Column(

                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Login",style: GoogleFonts.lilitaOne(
                      textStyle:const TextStyle(
                        fontSize: 70,
                        color: Colors.white,
                      ),
                    )),
                      Text("Enter your Information",style: GoogleFonts.aBeeZee(
                        textStyle:const TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),),
                  ],
                ),
              ),

            ),
            Padding(
              padding: const EdgeInsets.only(top: 250.0),
              child: Container(

                    decoration:const BoxDecoration(
                        color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(100),
                        topRight: Radius.circular(100),
                      ),

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
                            "assets/images/ills.png"
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
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=> ForgetScreen()));
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

                      UseAbleComp.customButton("Login", () {

                        SignIn(emailController.text.toString(), passwordController.text.toString());

                      }),
                      const  SizedBox(height: 10,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const  Text("Don't have an account? "),
                            InkWell(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>const SignUpScreen()));
                              },
                              child:const  Text("Sign up",style: TextStyle(
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
            )
          ],
        ),
      )
    );
  }
}
