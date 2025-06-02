import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'temporaryData.dart';

import 'package:smartstudy/utilities.dart';

String curUser = "";

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
    Map<String, dynamic> respBody = jsonDecode(req.body);
    String tempRegNo = respBody['regNo']; 
    print("this is the tempregno: "+tempRegNo);
    updateCurUser(tempRegNo);
    print("and this is the new curUser: "+curUser);
    return 1;
  }
  else {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: customText('Could not login into account', Color.fromARGB(255, 200, 100, 100), 15, 1))
    );
    return 0;
  }
}

Future<int> additionalInfoStatusCheck(String regNo) async {
  final url = Uri.parse("http://192.168.29.223:5000/additionalInfoStatus");

  final req = await http.post(
    url,
    headers: {'Content-Type' : 'Application/json'},
    body: json.encode(
      {
        'regNo' : regNo
      }
    )
  );

  if (req.statusCode == 200){ //this means that no data was found hence giving it 1 meaning that we can put data for this status code
    return 1;
  }
  else{
    return 0;
  }
}

Future<void> addAdditionalInfo(String regNo, int year, String department, String skillset, BuildContext context) async {
  final url = Uri.parse("http://192.168.29.223:5000/additionalInfo");

  await http.post(
    url,
    headers: {'Content-Type' : 'Application/json'},
    body: json.encode(
      {
        'regNo' : regNo,
        'department' : department,
        'year' : year,
        'skillset' : skillset
      }
    )
  );
}

Future<void> getAboutMeInfo(String regNo) async {
  final url = Uri.parse("http://192.168.29.223:5000/getAboutMe");

  final req = await http.post(
    url,
    headers: {'Content-Type' : 'Application/json'},
    body: json.encode(
      {
        'regNo' : regNo
      }
    )
  );
  
  if (req.statusCode == 200){
    print('Something came: ');
    List<dynamic> m = jsonDecode(req.body);
    tempName = m[1];
    tempEmailId = m[2];
    tempYear = m[5];
    tempDepartment = m[6];
    tempSkills = m[7];

    print("These are tempSkills" + tempSkills);
  }
  else{
    print('Nothing came: ');
    print(jsonDecode(req.body));
  }

}

void updateCurUser(String regNo) async {
  print("updated cur user: " + regNo);
  curUser = regNo;
}
