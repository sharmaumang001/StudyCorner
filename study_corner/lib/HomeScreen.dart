import 'package:flutter/material.dart';
import 'package:study_corner/feedback.dart';

import 'drawer.dart';
import 'user_details.dart';
import 'about.dart';

class HomeScreen extends StatefulWidget {
  static String id = 'home_screen';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List<Widget> widgetOptions = [
    AboutScreen(),
    UserForm(),
    
    FeedBack(),
    Container(
      color: Colors.pink,
    ),
  ];
  List<Text> headingOptions = [
    Text('Home'),
    Text('My Exams'),
    Text('Explore'),
    Text('Learn'),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: headingOptions[selectedIndex],
          backgroundColor: Color(0xff3F80FA),
          elevation: 0,
        ),
        drawer: DrawerWidget(),
        body: widgetOptions[selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.black),
              title: Text('Home'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.school, color: Colors.black),
              title: Text('My Exams'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.explore, color: Colors.black),
              title: Text('Explore'),
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.more, color: Colors.black),
                title: Text(
                  'Learn',
                  style: TextStyle(color: Colors.black),
                )),
          ],
          currentIndex: selectedIndex,
          onTap: (int i) {
            setState(() {
              selectedIndex = i;
            });
          },
        ),
      ),
    );
  }
}
