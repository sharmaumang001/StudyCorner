import 'package:flutter/material.dart';
import 'package:study_corner/edit_profile.dart';
import 'HomeScreen.dart';
import 'LoginPage.dart';
import 'quePaper.dart';
import 'quePaper.dart';
import 'quePaper.dart';
import 'upload_paper.dart';
import 'view_paper.dart';
import 'user_details.dart';

// this is the root of our application
void main() async {
  runApp(MyApp());
}

// MyApp is used to store all routes and takes the user to the page corresponding to initial route ('/)
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: LoginPage.id,
        routes: {
          LoginPage.id: (context) => LoginPage(),
          HomeScreen.id: (context) => HomeScreen(),
          quePaper.id:(context)=>quePaper(),
          UserForm.id:(context)=>UserForm(),
          Profile.id:(context)=>Profile(),
        });
  }
}
