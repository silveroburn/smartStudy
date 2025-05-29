import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smartstudy/projectInfo.dart';
import 'utilities.dart';

class Browse extends StatelessWidget{
  const Browse({super.key});

  final skills = 'c++, Java, Flutter, Unreal Engine';
  final leader = 'Ankit Yadav';
  final value = 9;

  Widget exploreBar(BuildContext context,String name, String skills, String leader, String mem) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return Projectinfo();
        }));
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white24,
          border: Border.all(
            color: Color.fromARGB(255, 200, 100, 100)
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded( 
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  customText(name, Colors.white, 18, 0), 
                  infoDump('Skills required', skills, Colors.white, 15, 1), 
                  infoDump('Creator', leader, Colors.white, 15, 1), 
                ],
              ),
            ),
            Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                customText('#Members', Colors.white, 18, 0), 
                customText(mem, Colors.white, 25, 0), 
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
  String members = value.toString();
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.only(top: 30, left: 20, right: 20),
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onLongPress: (){
            showDialog(context: context, builder: (context){
              return longPressMenu(context);
            });
          },
          child: Column(
            children: [
              Row(
                children: [
                  customText('>', Color.fromARGB(255, 200, 100, 100), 40, 1),
                  customText(' Explore', Colors.white, 40, 1),
                  customText('.', Color.fromARGB(255, 200, 100, 100), 40, 1),
                ],
              ),
              SizedBox(height: 30,),
              tFields(context, 'Search by Name'),
              SizedBox(height: 20,),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    child: Column(
                      children: [
                        exploreBar(context, 'Illumination Project', skills, leader, members),
                        SizedBox(height: 20,),
                        exploreBar(context, 'Illumination Project', skills, leader, members),
                        SizedBox(height: 20,),
                        exploreBar(context, 'Illumination Project', skills, leader, members),
                        SizedBox(height: 20,),
                        exploreBar(context, 'Illumination Project', skills, leader, members),
                        SizedBox(height: 20,),
                        exploreBar(context, 'Illumination Project', skills, leader, members),
                        SizedBox(height: 20,),
                        exploreBar(context, 'Illumination Project', skills, leader, members),
                        SizedBox(height: 20,),
                        exploreBar(context, 'Illumination Project', skills, leader, members),
                      ],
                    ),
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
