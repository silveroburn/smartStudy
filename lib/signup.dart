import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smartstudy/signin.dart';
import 'package:smartstudy/utilities.dart';

class signup extends StatelessWidget{
  const signup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          Text(
            'Sign in ', style: GoogleFonts.pixelifySans(color: Colors.white, fontSize: 25, fontWeight: FontWeight.w300),
          ),
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: IconButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>signin()));
              },
              icon: Icon(Icons.arrow_forward_rounded, color: Colors.white, size: 25,)),)
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(height: 50,),
              Padding(
                padding: EdgeInsets.only(left: 20, top: 100),
                child: Text('WELCOME ABOARD', style: GoogleFonts.pixelifySans(color: Color.fromARGB(255, 200, 100, 100), fontSize: 55, letterSpacing: 5, height: 1),),
              ),
              SizedBox(height: 90,),
              Column(
                children: [
                  tFields(context, 'Email ID'),
                  SizedBox(height: 20,),
                  tFields(context, 'Password'),
                  SizedBox(height: 20,),
                  tFields(context, 'Reg No'),
                ],
              ),
        
              SizedBox(height: 20,),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5)
                ),
                child: MaterialButton(
                  onPressed: (){
                  
                  },
                  color: Colors.transparent,
                  child: Text('Sign up', style: GoogleFonts.pixelifySans(color: Color.fromARGB(255, 200, 100, 100), fontSize: 30, fontWeight: FontWeight.w300),),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}