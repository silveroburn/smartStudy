import 'package:flutter/material.dart';
import 'utilities.dart';

class Chats extends StatelessWidget{
  const Chats({super.key});

  Widget chatObject(String side, String text) {
    double leftSide = 0.0;
    double rightSide = 0.0;
    Color c = Colors.white;
    if (side == 'right'){
      leftSide = 60;
      rightSide = 10;
      c = Colors.white24;
    }
    else if (side == 'left'){
      leftSide = 10;
      rightSide = 60;
      c = Color.fromARGB(255, 200, 80, 80);
    }
    return Padding(
      padding: EdgeInsets.only(top: 10, right: rightSide, bottom: 10, left: leftSide),
      child: Align(
        alignment: Alignment.centerRight,
        child: Container(
          decoration: BoxDecoration(
            color: c,
            borderRadius: BorderRadius.circular(5)
          ),
          padding: EdgeInsets.all(10),
          width: double.infinity,
          child: customText(text, Colors.white, 15, 1),
        ),
      ),
    );
  }

  Widget chatBound(String chat) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10), 
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(5), 
      ),
      alignment: Alignment.centerLeft, 
      child: customText(chat, Colors.white, 20, 1),
    );
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController chatBox = TextEditingController();
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.black,
      drawer: Drawer(
        backgroundColor: Color.fromARGB(255, 40, 40, 40),
        child: Padding(
          padding: EdgeInsets.only(left: 20, top: 30, right: 20),
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
              chatBound('Ashutosh Singh Naruka'),
              SizedBox(height: 10,),
              chatBound('Sameer Tiwari'),
              SizedBox(height: 10,),
              chatBound('Sanskar'),
              SizedBox(height: 10,),
              chatBound('Parth Bansal'),
              SizedBox(height: 10,),
              chatBound('Ankit Yadav'),
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  customText('> ', Color.fromARGB(255, 200, 100, 100), 40, 1),
                  customText('Chats', Colors.white, 40, 1),
                  customText('. ', Color.fromARGB(255, 200, 100, 100), 40, 1),
                ],
              ),
              SizedBox(height: 10,),
              customText('My Group1 (Group)', Colors.white60, 20, 0),
              SizedBox(height: 10,),
              Divider(
                color: Color.fromARGB(255, 200, 100, 100),
                height: 0.2,
                indent: 5,
                endIndent: 5,
              ),
              Expanded(child: Container()),
              chatObject('left', 'This is a text I had to send'),
              chatObject('right', 'What did you want to send'),
              chatObject('left', 'This is what'),
              chatObject('right', 'well what is it? out with it'),
              chatObject('left', 'Forget it.. I have changed my MIND'),
              chatObject('left', 'What the \$\$\$\$\$'),
              tFields(context, 'Type message', chatBox),
              SizedBox(height: 10,)
            ],
          ),
        ),
      ),
    );
  }

}