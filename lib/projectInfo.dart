import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smartstudy/chats.dart';
import 'utilities.dart';

class Projectinfo extends StatelessWidget {
  const Projectinfo({super.key});

  @override
  Widget build(BuildContext context) {
    String des = 'This is a project that involves the use of Opengl to create a scene that can approximately show how diffraction works along with a more detailed view of how the particles work at that moment in time';
    String skills = 'c++, Java, Kotlin, OpenGL, Python, WebSockets';
    bool Req = false;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.only(top: 30, left: 20, right: 20),
        child: Material(
          color: Colors.transparent,
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onLongPress: (){
              showDialog(context: context, builder: (context){
                return longPressMenu(context);
              });
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(
                  alignment: WrapAlignment.start,
                  children: [
                    customText('>', Color.fromARGB(255, 200, 100, 100), 40, 1),
                    customText(' Explore', Colors.white, 40, 1),
                    customText(' >', Color.fromARGB(255, 200, 100, 100), 40, 1),
                    customText(' Info', Colors.white, 40, 1),
                    customText('.', Color.fromARGB(255, 200, 100, 100), 40, 1),
                  ],
                ),
                SizedBox(height: 15,),
                Divider(color: Color.fromARGB(255, 180, 100, 100), height: 0.2, indent: 10, endIndent: 10, thickness: 1.5,),
                SizedBox(height: 15,),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        customText('Illumination Project', Colors.white, 40, 1), 
                        SizedBox(height: 20,),
                        infoDump('Description', des, Colors.white, 18, 1),
                        SizedBox(height: 20,),
                        infoDump('Skills Required', skills, Colors.white, 18, 1),
                        SizedBox(height: 20,),
                        infoDump('Members', '1. Ashutosh Singh Naruka (Leader)\n2. Parth Bansal\n3. Ankit Yadav\n4. Sameer Tiwari', Colors.white, 18, 1),
                        SizedBox(height: 20,),
                        infoDump('Max Team Size', '10', Colors.white, 18, 1),
                        SizedBox(height: 20,),
                        infoDump('Estimated Time For Completion', '2 months', Colors.white, 18, 1),
                        SizedBox(height: 20,),
                        infoDump('For hackathon?', 'Yes, CAD 2.0', Colors.white, 18, 1),
                        SizedBox(height: 20,),
                        infoDump('in-house Project', 'No', Colors.white, 18, 1),
                        SizedBox(height: 20,),
                        infoDump('Github Link', '<PRIVATE> (Join to access)', Colors.white, 18, 1),
                        SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context){
                                  return Chats();
                                }));
                              },
                              child: Container(
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 200, 100, 100),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: customText('Contact Leader', Colors.white, 20, 1),
                              ),
                            ),
                            SizedBox(width: 20,),
                            Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: Req?Color.fromARGB(255, 200, 100, 100): Colors.green,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: customText('Request Join', Colors.white, 20, 1),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}