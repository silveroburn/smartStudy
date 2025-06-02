import 'package:flutter/material.dart';
import 'package:smartstudy/qHandler.dart';
import 'package:smartstudy/temporaryData.dart';
import 'package:smartstudy/utilities.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    double fSize = 20;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.only(left: 20, top: 30, right: 20),
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
              Row(
                children: [
                  customText('>', Color.fromARGB(255, 200, 100, 100), 40, 1),
                  customText(' About Me', Colors.white, 40, 1),
                  customText(' .', Color.fromARGB(255, 200, 100, 100), 40, 1),
                ],
              ),
              SizedBox(height: 40,),
              infoDump('Name', tempName, Colors.white, fSize, 2),
              SizedBox(height: 10,),
              infoDump('Year', tempYear.toString(), Colors.white, fSize, 2),
              SizedBox(height: 10,),
              infoDump('Reg No', curUser, Colors.white, fSize, 2),
              SizedBox(height: 10,),
              infoDump('Department', tempDepartment, Colors.white, fSize, 2),
              SizedBox(height: 30,),
            
            
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.white.withAlpha(140)
                    )
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: EdgeInsets.only(left: 10, right: 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                customText('Hackathon 1', Colors.white, fSize, 1),
                                customText('Hackathon 2', Colors.white, fSize, 1),
                                customText('Hackathon 3', Colors.white, fSize, 1),
                                customText('Hackathon 4', Colors.white, fSize, 1),
                                customText('Hackathon 5', Colors.white, fSize, 1),
                                customText('Hackathon 16', Colors.white, fSize, 1),
                                customText('Hackathon 17', Colors.white, fSize, 1),
                                customText('Hackathon 18', Colors.white, fSize, 1),
          
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10,),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              customText('Hackathon1', Colors.white, fSize, 1),
                              customText('Hackathon1', Colors.white, fSize, 1),
                              customText('Hackathon1', Colors.white, fSize, 1),
          
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}