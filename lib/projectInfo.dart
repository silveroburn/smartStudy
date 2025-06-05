import 'package:flutter/material.dart';
import 'package:smartstudy/chats.dart';
import 'package:google_fonts/google_fonts.dart';
import 'utilities.dart';
import 'qHandler.dart';

class projectInfoStore extends StatefulWidget{
  final int projectId;
  const projectInfoStore(this.projectId, {super.key});

  @override
  State<projectInfoStore> createState() {
    return _Projectinfo();
  }
}

class _Projectinfo extends State<projectInfoStore> {
  List<dynamic> projectInfoData = [];
  
  @override
  void initState(){
    super.initState();
    getProjectInfo();
  }

  Future<void> getProjectInfo() async {
    print("Inside the set state function");
    projectInfoData = await exploreInfo(widget.projectId); 
    print("got the projectInfoData.. getting out now");
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    print("Inside the build nowwwww");

    if (projectInfoData.isEmpty) {
      return Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: CircularProgressIndicator(color: Colors.white, ),
        ),
      );
    }

    String des = projectInfoData[1];
    String minTime = projectInfoData[2].toString();
    String maxMembers = projectInfoData[3].toString();
    String skills = projectInfoData[4];
    String projectName = projectInfoData[5][0];
    List<dynamic> members = projectInfoData.length >= 7 ? projectInfoData[6] : [];

    print("inside build");
    print(members);
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
                        customText(projectName, Colors.white, 40, 1), 
                        SizedBox(height: 20,),
                        infoDump('Description', des, Colors.white, 18, 1),
                        SizedBox(height: 20,),
                        infoDump('Skills Required', skills, Colors.white, 18, 1),
                        SizedBox(height: 20,),
                        Text("Members: ", style: GoogleFonts.lato(color: Colors.white.withAlpha(150), fontSize: 18, fontWeight: FontWeight.normal)),
                        SizedBox(height: 10,),
                        Column(
                          children: List.generate(members.length, (index){
                            return Column(
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft, 
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white24,
                                      borderRadius: BorderRadius.circular(3),
                                    ),
                                    padding: EdgeInsets.only(left: 5, top: 3, right: 7, bottom: 3),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min, 
                                      children: [
                                        Text("${index + 1}. ", style: GoogleFonts.lato(color: Colors.white, fontSize: 18, fontWeight: FontWeight.normal),),
                                        Text(members[index][0], style: GoogleFonts.lato(color: Colors.white, fontSize: 18, fontWeight: FontWeight.normal,),),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),
                              ],
                            );

                          }),
                        ),
                        // infoDump('Members', '1. Ashutosh Singh Naruka (Leader)\n2. Parth Bansal\n3. Ankit Yadav\n4. Sameer Tiwari', Colors.white, 18, 1),
                        SizedBox(height: 20,),
                        infoDump('Max Team Size', maxMembers, Colors.white, 18, 1),
                        SizedBox(height: 20,),
                        infoDump('Estimated Time For Completion', minTime, Colors.white, 18, 1),
                        SizedBox(height: 20,),
                        infoDump('For hackathon?', 'Feature yet to be implemented', Colors.white, 18, 1),
                        SizedBox(height: 20,),
                        infoDump('in-house Project', 'Feature yet to be implemented', Colors.white, 18, 1),
                        SizedBox(height: 20,),
                        infoDump('Github Link', 'Feature yet to be implemented', Colors.white, 18, 1,),
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