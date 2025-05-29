import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'utilities.dart';

class Chats extends StatelessWidget{
  const Chats({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.only(left: 20, right: 20, top: 30),
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onLongPress: () {
            showDialog(context: context, builder: (context){
              return longPressMenu(context);
            });
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