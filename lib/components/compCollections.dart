import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UseAbleComp{
  static customTextFormField({required TextEditingController controller, required String text , required IconData iconData,required bool toHide }){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
      child: TextFormField(
        controller: controller,
        obscureText: toHide,
        decoration: InputDecoration(
          hintText: text,
         suffixIcon: Icon(iconData,color:const  Color(0xff3E6DEC),),
         border: OutlineInputBorder(
           borderRadius: BorderRadius.circular(50),
         )
        ),
      ),
    );
  }


  static customButton( String text,  VoidCallback callback){
    return SizedBox(
      width: 300,
      height: 50,
      child: ElevatedButton(
          onPressed: (){
            callback();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue
          ),
          child: Text(text , style:  GoogleFonts.aBeeZee(
            textStyle:const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 22,

            ),
          ))),
    );

}

static customAlertBox(BuildContext context , String text){

    return showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title:Text(text, textAlign: TextAlign.center, style: const TextStyle(
              fontSize: 14.0,
            ),),
            actions: [
              TextButton(onPressed: (){

                Navigator.pop(context);
              }, child:const Text("ok")),
            ],
          );
        }
    );

}
}