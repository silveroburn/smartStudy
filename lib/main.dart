import 'package:flutter/material.dart';
import 'package:smartstudy/profile.dart';
import 'package:smartstudy/signin.dart';
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