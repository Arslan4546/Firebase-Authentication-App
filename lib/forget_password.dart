import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_authentication_app/components/compCollections.dart';
import 'package:firebase_authentication_app/loginScreen.dart';
import 'package:flutter/material.dart';
class ForgetScreen extends StatefulWidget {
  const ForgetScreen({super.key});

  @override
  State<ForgetScreen> createState() => _ForgetScreenState();
}

class _ForgetScreenState extends State<ForgetScreen> {

  TextEditingController emailController = TextEditingController();

  ForgetPassword(String email) async {

    if(email == ""){

      return UseAbleComp.customAlertBox(context, "Please enter the email first then click on the reset Option \n Thank You");


    }else{

    await UseAbleComp.customAlertBox(context, "Email has been sent to your email address.Please check Your Email \n Thank You");

    FirebaseAuth.instance.sendPasswordResetEmail(email: email).then((value) => Navigator.push(context, MaterialPageRoute(builder: (context)=> const LoginScreen())));

    }
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor:const Color(0xff3E6DEC),
        centerTitle: true,
        title: const Text("Reset Password", style: TextStyle(color: Colors.white),),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
                 UseAbleComp.customTextFormField(controller: emailController, text: "Enter Your Email", iconData: Icons.email, toHide: false),

            const SizedBox(height: 10.0,),

            UseAbleComp.customButton("Reset Password", () {
                     ForgetPassword(emailController.text.toString());
            })
          ],
        ),
      ),

    );
  }
}
