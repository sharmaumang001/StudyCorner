import 'package:flutter/material.dart';


class AboutScreen extends StatelessWidget {
  static String id = 'about_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
        body:  ListView(children: [
          Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            Container(
                margin: const EdgeInsets.all(7.0),
                child: Material(
                    elevation: 3.0,
                    borderRadius: BorderRadius.circular(10.0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            height: 10.0,
                          ),
                          ListTile(
                            title: Text('Study Corner',
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 28.0,
                                    fontFamily: 'Segoe UI',
                                    color: Colors.grey[700])),
                            subtitle: Text('Welcome!!',
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Segoe UI',
                                    color: Colors.grey[700])),
                            leading: Image.asset(
                              'assets/study.png',
                              width: 35.0,
                              height: 35.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                          ListTile(
                              title: Text('Grade 10',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Segoe UI',
                                      color: Colors.grey[700])),
                              subtitle: Text('CBSE',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Segoe UI',
                                      color: Colors.grey[700])),
                              leading: Icon(Icons.school,
                                  color: Colors.grey[800])),
                          ListTile(
                              title: Text('Book Your Evaluations',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Segoe UI',
                                      color: Colors.grey[800])),
                              subtitle: Text('My Assignments',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Segoe UI',
                                      color: Colors.grey[700])),
                              leading:
                              Icon(Icons.book, color: Colors.grey[800])),
                          ListTile(
                              title: Text('My Exams',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Segoe UI',
                                      color: Colors.grey[800])),
                              subtitle: Text(
                                  'Complete your pending tasks',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Segoe UI',
                                      color: Colors.grey[700])),
                              leading: Icon(Icons.work,
                                  color: Colors.grey[800])),
                        ]))),
            SizedBox(height: 10.0),
            Container(
                margin: const EdgeInsets.all(7.0),
                child: Material(
                    elevation: 3.0,
                    borderRadius: BorderRadius.circular(10.0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            height: 10.0,
                          ),
                          ListTile(
                            title: Text('Students List',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Segoe UI',
                                    color: Colors.grey[900])),
                          ),
                          ListTile(
                            title: Text('My Students',
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Segoe UI',
                                    color: Colors.grey[700])),
                            leading: Icon(Icons.group, color: Colors.grey[800]),
                          ),
                          Container(
                            color: Colors.grey[200],
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(height: 35.0),
                                ListTile(
                                    title: Text('Anjali Soni',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontFamily: 'Segoe UI',
                                            color: Colors.grey[900])),
                                    subtitle: Text('Student 1',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontFamily: 'Segoe UI',
                                            color: Colors.grey[700])),
                                    leading: Container(
                                      width: 60.0,
                                      height: 80.0,
                                      decoration: new BoxDecoration(
                                        color: Colors.white,
                                        image: new DecorationImage(
                                          image: AssetImage('assets/study.png'),
                                          fit: BoxFit.cover,
                                        ),
                                        borderRadius: new BorderRadius.all(
                                            new Radius.circular(50.0)),
                                        border: new Border.all(
                                          color: Colors.white,
                                          width: 2.0,
                                        ),
                                      ),
                                    )),
                                SizedBox(height: 20.0),
                                ListTile(
                                    title: Text('Soni Anjali',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontFamily: 'Segoe UI',
                                            color: Colors.grey[900])),
                                    subtitle: Text('Student 2',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontFamily: 'Segoe UI',
                                            color: Colors.grey[700])),
                                    leading: Container(
                                      width: 60.0,
                                      height: 80.0,
                                      decoration: new BoxDecoration(
                                        color: Colors.white,
                                        image: new DecorationImage(
                                          image: AssetImage('assets/study.png'),
                                          fit: BoxFit.cover,
                                        ),
                                        borderRadius: new BorderRadius.all(
                                            new Radius.circular(50.0)),
                                        border: new Border.all(
                                          color: Colors.white,
                                          width: 2.0,
                                        ),
                                      ),
                                    )),
                                SizedBox(height: 20.0),
                                ListTile(
                                    title: Text('Anjali Soni',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontFamily: 'Segoe UI',
                                            color: Colors.grey[900])),
                                    subtitle: Text('Student 3',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontFamily: 'Segoe UI',
                                            color: Colors.grey[700])),
                                    leading: Container(
                                      width: 60.0,
                                      height: 80.0,
                                      decoration: new BoxDecoration(
                                        color: Colors.white,
                                        image: new DecorationImage(
                                          image: AssetImage('assets/study.png'),
                                          fit: BoxFit.cover,
                                        ),
                                        borderRadius: new BorderRadius.all(
                                            new Radius.circular(50.0)),
                                        border: new Border.all(
                                          color: Colors.white,
                                          width: 2.0,
                                        ),
                                      ),
                                    )),
                                SizedBox(height: 20.0),
                                ListTile(
                                    title: Text('Rahul Sony',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontFamily: 'Segoe UI',
                                            color: Colors.grey[900])),
                                    subtitle: Text('Student 4',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontFamily: 'Segoe UI',
                                            color: Colors.grey[700])),
                                    leading: Container(
                                      width: 60.0,
                                      height: 80.0,
                                      decoration: new BoxDecoration(
                                        color: Colors.white,
                                        image: new DecorationImage(
                                          image: AssetImage('assets/study.png'),
                                          fit: BoxFit.cover,
                                        ),
                                        borderRadius: new BorderRadius.all(
                                            new Radius.circular(50.0)),
                                        border: new Border.all(
                                          color: Colors.white,
                                          width: 2.0,
                                        ),
                                      ),
                                    )),
                                SizedBox(height: 20.0),
                              ],
                            ),
                          )
                        ]))),
          ])
        ])
    );
  }
}
