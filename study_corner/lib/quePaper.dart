import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'upload_paper.dart';
import 'package:firebase_database/firebase_database.dart';
import 'view_paper.dart';

import 'paper_def.dart';

class quePaper extends StatefulWidget {
  static const id = "que_paper";
  @override
  _quePaperState createState() => _quePaperState();
}

class _quePaperState extends State<quePaper> {
  String course = '';
  String year = '';
  String dropdownValue =
      ' Type of Paper                                                   ';

  final Controller1 = TextEditingController();
  final Controller2 = TextEditingController();
  @override
  void dispose() {
    Controller1.dispose();
    Controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Question Papers"),
        backgroundColor: Color(0xff3F80FA),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(hintText: 'Course Code (Eg: CS222)'),
              controller: Controller1,
            ),
            SizedBox(height: 30),
            
              DropdownButton<String>(
                isExpanded: true,
                value: dropdownValue,
                icon: Icon(Icons.arrow_drop_down),
                iconSize: 24,
                elevation: 10,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 17.0,
                ),
                onChanged: (String newValue) {
                  setState(() {
                    dropdownValue = newValue;
                  });
                },
                items: <String>[
                  ' Type of Paper                                                   ',
                  'Quiz 1',
                  'Midsem',
                  'Quiz 2',
                  'Endsem',
                  'Others'
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            
            SizedBox(height: 30),
            TextField(
              decoration:
                  InputDecoration(hintText: 'Year of Examination (Optional)'),
              controller: Controller2,
            ),
            SizedBox(height: 30),
            Container(
              margin: EdgeInsets.all(16),
              width: 220,
              height: 50,
              child: FlatButton(
                onPressed: () async {
                  course = Controller1.text;
                  year = Controller2.text;

                  if (course == '') {
                    Fluttertoast.showToast(
                        msg: 'Course code cannot be empty',
                        backgroundColor: Colors.white70,
                        textColor: Colors.black);
                  } else if (dropdownValue ==
                      ' Type of Paper                                                   ') {
                    Fluttertoast.showToast(
                        msg: 'Please select a paper type',
                        backgroundColor: Colors.white70,
                        textColor: Colors.black);
                  } else {
                    String Year = year;
                    String CourseCode = course.toUpperCase();
                    String Type = dropdownValue;
                    List<paper> list = new List();
                    if (Year != "") {
                      print(course);
                      print(year);
                      DatabaseReference ref = FirebaseDatabase.instance
                          .reference()
                          .child('Uploads/' +
                              CourseCode +
                              '_' +
                              Type +
                              '/' +
                              Year);
                      await ref.once().then((DataSnapshot snapshot) {
                        Map<dynamic, dynamic> map = snapshot.value;
                        map.forEach((key, value) {
                          print("value" + value);
                          list.add(new paper.fromSnapshot(value));
                        });
                      });
                    } else {
                      //TODO GET back the files uploaded
                      DatabaseReference ref = await FirebaseDatabase.instance
                          .reference()
                          .child('Uploads/' + CourseCode + '_' + Type);
                      await ref.once().then((DataSnapshot snapshot) {
                        Map<dynamic, dynamic> map = snapshot.value;
                        map.forEach((key, value) {
                          Map<dynamic, dynamic> map1 = value;
                          map1.forEach((key, value1) {
                            list.add(paper.fromSnapshot(value1));
                          });
                        });
                      });
                    }

                    if (list.length == 0) {
                      print("no paper found");
                    }
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => view_paper(list: list),
                      ),
                    );
                  }
                },
                child: Text(
                  'Find Paper',
                  style: new TextStyle(fontSize: 20),
                ),
                color: Colors.blue,
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => uploadPaper(),
            ),
          );
          print('done');
        },
        backgroundColor: Colors.blue,
        child: Icon(Icons.file_upload),
      ),
    );
  }
}
