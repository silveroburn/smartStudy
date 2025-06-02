import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:smartstudy/utilities.dart';

Future<int> signupQ (String regNo, String emailId, String username, String password, BuildContext context) async {
  final url = Uri.parse("http://192.168.29.223:5000/signup");

  final req = await http.post(
    url,
    headers: {'Content-Type' : 'Application/json'},
    body: json.encode(
      {
        'regNo' : regNo,
        'emailId' : emailId,
        'name' : username,
        'password' : password
      }
    )
  );

  if (req.statusCode == 409){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: customText('User already exists', Color.fromARGB(255, 200, 100, 100), 15, 1))
    );
    return 0;
  }
  else {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: customText('User successfully created', Colors.white, 15, 1))
    );
    return 1;
  }
}

Future<int> signinQ(String name, String password, BuildContext context) async {
  final url = Uri.parse("http://192.168.29.223:5000/signin");

  final req = await http.post(
    url, 
    headers: {'Content-Type' : 'Application/json'},
    body: json.encode({
      'name' : name,
      'password' : password
    })
  );

  if (req.statusCode == 202){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: customText('Account login successful', Colors.white, 15, 1))
    );
    return 1;
  }
  else {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: customText('Could not login into account', Color.fromARGB(255, 200, 100, 100), 15, 1))
    );
    return 0;
  }
}