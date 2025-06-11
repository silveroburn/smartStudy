import 'package:flutter/material.dart';
import 'package:smartstudy/qHandler.dart';
import 'package:smartstudy/signin.dart';
import 'package:smartstudy/strictLogin.dart';
import 'package:smartstudy/temporaryData.dart';
import 'package:smartstudy/utilities.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey messageIconKey = GlobalKey();
  bool showFloatingContainer = false;
  Offset? containerPosition;

  void _toggleFloatingContainer() {
    final RenderBox? renderBox = messageIconKey.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox == null) return;
    
    final position = renderBox.localToGlobal(Offset.zero);
    final size = renderBox.size;
    
    setState(() {
      showFloatingContainer = !showFloatingContainer;
      if (showFloatingContainer) {
        containerPosition = Offset(
          position.dx - 300 + size.width, 
          position.dy,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double fSize = 20;
    if (curUser == "") {
      return Strictlogin();
    }
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20, top: 30, right: 20),
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onLongPress: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return longPressMenu(context);
                    });
              },
              onTap: () {
                if (showFloatingContainer) {
                  setState(() {
                    showFloatingContainer = false;
                  });
                }
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      customText('>', Color.fromARGB(255, 200, 100, 100), 40, 1),
                      customText(' About Me', Colors.white, 40, 1),
                      customText(' .', Color.fromARGB(255, 200, 100, 100), 40, 1),
                      Expanded(child: SizedBox()),
                      GestureDetector(
                          key: messageIconKey,
                          onTap: _toggleFloatingContainer,
                          child: Icon(
                            Icons.message_outlined,
                            color: Colors.white,
                            size: 30,
                          )),
                      SizedBox(
                        width: 20,
                      ),
                      GestureDetector(
                          onTap: () async {
                            await releaseLoginId();
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return signin();
                            }));
                          },
                          child: Icon(
                            Icons.logout_rounded,
                            color: Colors.white,
                            size: 30,
                          ))
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  infoDump('Name', tempName, Colors.white, fSize, 2),
                  SizedBox(
                    height: 10,
                  ),
                  infoDump('Year', tempYear.toString(), Colors.white, fSize, 2),
                  SizedBox(
                    height: 10,
                  ),
                  infoDump('Reg No', curUser, Colors.white, fSize, 2),
                  SizedBox(
                    height: 10,
                  ),
                  infoDump('Department', tempDepartment, Colors.white, fSize, 2),
                  SizedBox(
                    height: 30,
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.white.withAlpha(140))),
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
                          SizedBox(
                            width: 10,
                          ),
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
          if (showFloatingContainer && containerPosition != null)
            Positioned(
              left: containerPosition!.dx,
              top: containerPosition!.dy,
              child: Container(
                width: 300,
                height: 150,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 50, 50, 50),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Color.fromARGB(255, 200, 100, 100),
                    width: 2,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 8,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Messages',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                showFloatingContainer = false;
                              });
                            },
                            child: Icon(
                              Icons.close,
                              color: Colors.white,
                              size: 18,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12),
                      Text(
                        'No new messages',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Check back later for updates',
                        style: TextStyle(
                          color: Colors.white60,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}