import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smartstudy/CreateProject.dart';
import 'package:smartstudy/additionalInfo.dart';
import 'package:smartstudy/browse.dart';
import 'package:smartstudy/chats.dart';
import 'package:smartstudy/profile.dart';
import 'package:smartstudy/qHandler.dart';
import 'package:smartstudy/strictLogin.dart';
import 'temporaryData.dart';

Widget tFields (BuildContext context, String hint, TextEditingController controller){
  return TextField(
    controller: controller,
    cursorColor: Colors.white,
    style: GoogleFonts.poppins(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w200),
    decoration: InputDecoration(  
      hintText: hint, 
      hintStyle: GoogleFonts.pixelifySans(color: Colors.white70, fontSize: 20, fontWeight: FontWeight.w300),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide(color: Colors.white)
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Color.fromARGB(255, 200, 100, 100),
        )
      )
    ),
  );
}

Widget customText(String text, Color inputColor, double size, int weight){
  FontWeight w = FontWeight.normal;
  if (weight == 0){
    w = FontWeight.w200;
  }
  else if (weight == 1){
    w = FontWeight.normal;
  }
  else if (weight >= 2) {
    w = FontWeight.bold;
  }
  return Text(text, style: GoogleFonts.pixelifySans(color: inputColor, fontSize: size, fontWeight: w),);
}

Widget infoDump(String text, String second, Color inputColor, double size, int weight){
  FontWeight w = FontWeight.normal;
  if (weight == 0){
    w = FontWeight.w200;
  }
  else if (weight == 1){
    w = FontWeight.normal;
  }
  else if (weight >= 2) {
    w = FontWeight.bold;
  }

  String newText= text + ':';
  Color newColor = inputColor.withAlpha(150);

  return Wrap(
    spacing: 10,
    children: [
      Text(newText, style: GoogleFonts.lato(color: newColor, fontSize: size, fontWeight: w),),
      Text(second, style: GoogleFonts.lato(color: inputColor, fontSize: size, fontWeight: w),)
    ]
  );
}

Future<void> releaseLoginId () async {
  curUser = "";
}

Widget longPressMenu(BuildContext context){
  return AlertDialog(
    backgroundColor: Colors.black,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
      side: BorderSide(color: Colors.white.withAlpha(140), width: 1)
    ),
    content: IntrinsicHeight(
      child: Column(
        children: [
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return Profile();
              }));
            },
            child: customText('About Me', Color.fromARGB(255, 200, 100, 100), 30, 1)
          ),
          SizedBox(height: 15,),
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return browseStore();
              }));
            },
            child: customText('Browse Projects', Colors.white.withAlpha(180), 30, 1)
          ),
          SizedBox(height: 15,),
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return Chats();
              }));
            },
            child: customText('Chats', Colors.white.withAlpha(180), 30, 1)),
          SizedBox(height: 15,),
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return store();
              }));
            },
            child: customText('Create Project', Colors.white.withAlpha(180), 30, 1)
          ),
          SizedBox(height: 15,),
        ],
      ),
    ),
  );
}