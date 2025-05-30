import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'utilities.dart';

class store extends StatefulWidget{
  @override
  State<store> createState() {
    return _CreateProject();
  }
}

class _CreateProject extends State<store> {
  var count = 2;
  Widget _createField(String text){
    return TextField(
      cursorColor: Colors.white,
      style: GoogleFonts.poppins(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w200),
      decoration: InputDecoration(
        fillColor: Colors.black,
        isDense: true,
        contentPadding: EdgeInsets.only(left: 10, top: 5, right: 5, bottom: 5),
        hintText: text,
        hintStyle: GoogleFonts.poppins(color: Colors.white60, fontSize: 20, fontWeight: FontWeight.w400),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: Color.fromARGB(255, 200, 100, 100)),
        ),
        focusColor: Colors.red,
      ),
    );
  }

  @override
  void initState(){
    super.initState();

    count = 1;
  }
  
  @override 
  Widget build(BuildContext context) {
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
                customText('Create Project', Colors.white, 40, 1),
                customText('.', Color.fromARGB(255, 200, 100, 100), 40, 1),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20,),
                    customText('Name of the Project', Colors.white, 20, 0),
                    SizedBox(height: 10,),
                    _createField('Enter the name'),
                    SizedBox(height: 20,),
                    Row(
                      children: [
                        customText('Initial Members Reg No.', Colors.white, 20, 0),
                        Expanded(child: SizedBox()),
                        GestureDetector(
                          onTap: (){
                            count++;
                            setState(() {
                            });
                          },
                          child: Icon(Icons.add_outlined, color: Colors.white, size: 20,)
                        ),
                        GestureDetector(
                          onTap: (){
                            if (count == 1){
                              count = 1;
                            }
                            else{
                              count--;
                            }
                            setState(() {
                            });
                          },
                          child: Icon(Icons.remove, color: Colors.white, size: 20,)
                        ),
                      ]
                    ),
                    SizedBox(height: 10,),
                    Column(
                      children:
                        List.generate(count, (context){
                          return Column(
                            children: [
                              _createField('Enter the Reg No.'),
                              SizedBox(height: 10,),
                            ],
                          );
                        }
                      ),
                    ),
                    SizedBox(height: 10,),
                    customText('Est. Time for Completion', Colors.white, 20, 0),
                    SizedBox(height: 10,),
                    _createField('Enter the #months (if less then <1)'),
                    SizedBox(height: 10,),
                    // _createField('Enter the name'),    
                  ],
                ),
              ),
            ),
            
            
          ],
        ),
      ),
    );
  }
}