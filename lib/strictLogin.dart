import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smartstudy/signin.dart';
import 'package:smartstudy/signup.dart';
import 'package:smartstudy/utilities.dart';

class Strictlogin extends StatelessWidget{
  const Strictlogin({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.only(left: 20, right: 20, top: 40, bottom: 40),
        child: Align(
          alignment: Alignment.center,
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return signup();
                    }));
                  },
                  child: Row(
                    children: [
                      Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white, size: 30,),
                      customText('Sign up', Color.fromARGB(255, 200, 100, 100), 30, 1),
                    ]),
                )),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    customText('No account setup', Color.fromARGB(255, 200, 100, 100), 30, 1),
                    SizedBox(height: 15,),
                    customText('Login using an account or create one', Colors.white, 18, 1) 
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  children: [
                    Expanded(child: SizedBox()),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                          return signin();
                        }));
                      },
                      child: Row(
                        children: [
                          customText('Sign in', Color.fromARGB(255, 200, 100, 100), 30, 1),
                          Icon(Icons.arrow_forward_ios_rounded, color: Colors.white, size: 30,),
                        ]),
                    ),
                  ]
                )),
            ],
          ),
        ),
      ),
    );
  }
}