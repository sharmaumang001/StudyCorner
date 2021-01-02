import 'package:flutter/material.dart';

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
            Container(
              child: Center(
                child: Text(
                  'Hi User!',
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
            ListTileWidget(
              text: 'Home',
              icon: Icon(
                Icons.home,
                color: Colors.black,
              ),
              onTap: () {},
            ),
            ListTileWidget(
              text: 'Exam Corner',
              icon: Icon(
                Icons.school,
                color: Colors.black,
              ),
              onTap: () {
                //TODO:Navigate to that screen
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
              onTap: () {},
            ),
            ListTileWidget(
              text: 'Logout',
              icon: Icon(
                Icons.logout,
                color: Colors.black,
              ),
              onTap: () {},
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
