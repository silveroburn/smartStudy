import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smartstudy/additionalInfo.dart';
import 'package:smartstudy/profile.dart';
import 'package:smartstudy/qHandler.dart';
import 'package:smartstudy/signup.dart';
import 'temporaryData.dart';
import 'package:smartstudy/stateInfo.dart';
import 'package:smartstudy/utilities.dart';

class signin extends StatelessWidget{
  const signin({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leadingWidth: 50,
        backgroundColor: Colors.black,
        leading: GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return signup();
            }));
          },
          child: Padding(
            padding: EdgeInsets.only(left: 20),
            child: IconButton(
              onPressed: (){
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_rounded, color: Colors.white, size: 25,))
          ),
        ),
        title: Text(
          'Sign up ', style: GoogleFonts.pixelifySans(color: Colors.white, fontSize: 25, fontWeight: FontWeight.w300),
        ),
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
                child: Text('WELCOME BACK', style: GoogleFonts.pixelifySans(color: Color.fromARGB(255, 200, 100, 100), fontSize: 55, letterSpacing: 5, height: 1),),
              ),
              SizedBox(height: 90,),
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  children: [
                    tFields(context, 'Reg No || email ID', nameController),
                    SizedBox(height: 20,),
                    tFields(context, 'Password', passwordController),
                  ],
                ),
              ),
        
              SizedBox(height: 20,),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5)
                ),
                child: MaterialButton(
                  onPressed: () async {
                    var data = await signinQ(nameController.text, passwordController.text, context);
                    if (data == 1){
                      var data2 = await additionalInfoStatusCheck(curUser);
                      if (data2 == 1){
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                          return Additionalinfo();
                        }));
                      }
                      else{
                        await getAboutMeInfo();
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                          return Profile();
                        }));
                      }
                    }
                  },
                  color: Colors.transparent,
                  child: Text('Sign in', style: GoogleFonts.pixelifySans(color: Color.fromARGB(255, 200, 100, 100), fontSize: 30, fontWeight: FontWeight.w300),),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}