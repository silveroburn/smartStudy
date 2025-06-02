import 'package:flutter/material.dart';
import 'package:smartstudy/profile.dart';
import 'package:smartstudy/qHandler.dart';
import 'package:smartstudy/utilities.dart';

class Additionalinfo extends StatelessWidget{
  const Additionalinfo({super.key});

  @override 
  Widget build (BuildContext context){
    TextEditingController yearController = TextEditingController();
    TextEditingController DepartmentController = TextEditingController();
    TextEditingController skillsController = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.only(top: 30, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                customText('>', Color.fromARGB(255, 200, 100, 100), 40, 1),
                customText('Additional Info', Colors.white, 40, 1),
                customText('.', Color.fromARGB(255, 200, 100, 100), 40, 1),
              ]),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 40,),
                    customText('Year', Colors.white, 20, 0),
                    SizedBox(height: 10,),
                    tFields(context, 'enter current year (1-4)', yearController),
                    SizedBox(height: 30,),
                    customText('Department', Colors.white, 20, 0),
                    SizedBox(height: 10,),
                    tFields(context, 'enter your department', DepartmentController),
                    SizedBox(height: 30,),
                    customText('current Skillset \n(press enter to add)', Colors.white, 20, 0),
                    SizedBox(height: 10,),
                    tFields(context, 'add your skillset tags', skillsController),
                    SizedBox(height: 30,),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () async {
                print("adding reg no: " + curUser);
                await addAdditionalInfo(curUser, int.parse(yearController.text), DepartmentController.text, skillsController.text, context);
                await getAboutMeInfo(curUser);
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return Profile();
                }));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  customText('.', Color.fromARGB(255, 200, 100, 100), 40, 1),
                  customText('Next', Colors.white, 40, 1),
                  customText('>', Color.fromARGB(255, 200, 100, 100), 40, 1),
                ]
              ),
            ),
          ],
        ), 
      )
    );
  }
}