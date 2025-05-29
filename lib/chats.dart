import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'utilities.dart';

class Chats extends StatelessWidget{
  const Chats({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.black,
      drawer: Drawer(
        backgroundColor: Color.fromARGB(255, 40, 40, 40),
        child: Padding(
          padding: EdgeInsets.only(left: 40, top: 30, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  customText('> ', Color.fromARGB(255, 200, 100, 100), 40, 1),
                  customText('Contacts', Colors.white, 40, 1),
                  customText('. ', Color.fromARGB(255, 200, 100, 100), 40, 1),
                ],
              ),
              SizedBox(height: 40,),
              customText('Ashutosh Singh Naruka year 3', Colors.white, 20, 1),
              SizedBox(height: 20,),
              customText('Sameery Tiwari', Colors.white, 20, 1),
              SizedBox(height: 20,),
              customText('Sanskar', Colors.white, 20, 1),
              SizedBox(height: 20,),
              customText('Parth Bansal', Colors.white, 20, 1),
              SizedBox(height: 20,),
              customText('Ankit Yadav', Colors.white, 20, 1),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 20, right: 20, top: 30),
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onLongPress: () {
            showDialog(context: context, builder: (context){
              return longPressMenu(context);
            });
          },
          onPanUpdate: (details){
            if (details.delta.dx > 10){
              _scaffoldKey.currentState?.openDrawer();
            }
          },
          child: Column(
            children: [
              Row(
                children: [
                  customText('> ', Color.fromARGB(255, 200, 100, 100), 40, 1),
                  customText('Chats', Colors.white, 40, 1),
                  customText('. ', Color.fromARGB(255, 200, 100, 100), 40, 1),
                ],
              ),
              Expanded(child: Container()),
              tFields(context, 'Type message'),
              SizedBox(height: 10,)
            ],
          ),
        ),
      ),
    );
  }
}