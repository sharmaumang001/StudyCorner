import 'package:flutter/material.dart';
import 'quePaper.dart';
import 'sign_in.dart';
import 'LoginPage.dart';
import 'package:share/share.dart';

import 'user_profile.dart';
class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Color(0xFFFFFFFF),
        padding: EdgeInsets.all(10.0),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            CircleAvatar(
              
              child: ClipOval(
                
                child: Image.network(
                  user_imageUrl.substring(0, user_imageUrl.length - 5) + 's400-c',
                  height: 130,
                  width: 130,
                  fit: BoxFit.cover,
                ),
              ),
              radius: 60,
              backgroundColor: Colors.transparent,
            ),
            Container(
              child: Center(
                child: Text(
                  'Hi ${user_name}!',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 5.0),
              child: Center(
                child: Text(
                  'CBSE Grade 10',
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 5.0),
              child: Center(
                child: Text(
                  user_email,
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            ListTileWidget(
              text: 'Home',
              icon: Icon(
                Icons.home,
                color: Colors.black,
              ),
              onTap: () {},
            ),
             ListTileWidget(
              text: 'My Profile',
              icon: Icon(
                Icons.people,
                color: Colors.black,
              ),
              onTap: () {
                  
               Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return UserProfile();
                },
              ),
            );

            
              },
            ),
            ListTileWidget(
              text: 'Exam Corner',
              icon: Icon(
                Icons.school,
                color: Colors.black,
              ),
              onTap: () {
                //TODO:Navigate to that screen
                Navigator.pushNamed(context, quePaper.id);
                print('done');
              },
            ),
            ListTileWidget(
              text: 'My Feedback',
              icon: Icon(
                Icons.feedback,
                color: Colors.black,
              ),
              onTap: () {
                //TODO:Navigate to that screen
                print('done');
              },
            ),
            ListTileWidget(
              text: 'Learn',
              icon: Icon(
                Icons.more,
                color: Colors.black,
              ),
              onTap: () {
                //TODO:Navigate to that screen
                print('done');
              },
            ),
            ListTileWidget(
              text: 'Refer a friend',
              icon: Icon(
                Icons.share,
                color: Colors.black,
              ),
              onTap: () {
                Share.share('Visit my website https://google.com/',
                    subject: 'Install this app Now!');
              },
            ),
            ListTileWidget(
              text: 'Logout',
              icon: Icon(
                Icons.logout,
                color: Colors.black,
              ),
              onTap: () {
                signOutGoogle();
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) {
                  return LoginPage();
                }), ModalRoute.withName('/'));
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ListTileWidget extends StatelessWidget {
  const ListTileWidget({@required this.text, @required this.icon, this.onTap});
  final String text;
  final Icon icon;
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListTile(
        title: Text(text, style: TextStyle(color: Colors.black)),
        leading: icon,
        onTap: onTap,
      ),
    );
  }
}
