import 'package:flutter/material.dart';
import 'package:smartstudy/temporaryData.dart';
import 'qHandler.dart';
import 'package:smartstudy/projectInfo.dart';
import 'utilities.dart';

class browseStore extends StatefulWidget{
  const browseStore({super.key});

  @override
  State<browseStore> createState() {
    return _browse();
  }
}

class _browse extends State<browseStore>{
  List<dynamic> count = [];
  TextEditingController searchBar = TextEditingController();

  Widget exploreBar(BuildContext context,String name, String skills, String leader, String mem, int id) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return projectInfoStore(id);
        }));
      },
      child: Column(
        children: [
          Container(
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
          SizedBox(height: 20,)
        ]
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    updataBrowseData();
  }

  Future<void> updataBrowseData() async {
    await getBrowseInfo();
    setState(() {
      count = browsable;
    });
  }

  @override
  Widget build(BuildContext context) {
  // String members = value.toString();
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
              tFields(context, 'Search by Name', searchBar),
              SizedBox(height: 20,),
              if (count.isNotEmpty) Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    child: Column(
                      children: List.generate(count.length, (index)
                      {
                        return exploreBar(context, count[index][1].toString(), count[index][3].toString(), count[index][2].toString(), count[index][4].toString(), count[index][0]);
                      }
                      ),
                    ),
                  ),
                ),
              ) else SizedBox(height: 10,), 
              ],
          ),
        ),
      ),
    );
  }

}
