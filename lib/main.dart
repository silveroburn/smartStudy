//reliable way for storing the current login regNo.. currently I am storing it by logging in everytime.. 

import 'package:flutter/material.dart';
import 'package:smartstudy/signup.dart';

void main(){
  runApp(App());
}

class App extends StatelessWidget{
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: signup()
    );
  }
}