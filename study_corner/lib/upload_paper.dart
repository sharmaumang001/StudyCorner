import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'firebasefunctions.dart';
import 'dart:io';
import 'package:path/path.dart';

import 'paper_def.dart';

class uploadPaper extends StatefulWidget{
  @override
  _uploadPaperState createState() => _uploadPaperState();
}

class _uploadPaperState extends State<uploadPaper>
{
  String course='';
  String year='';
  String professor='';
  String dropdownValue = ' Type of Paper                                                   ';
  String filename='';
  var file;

  final Controller1 = TextEditingController();
  final Controller2 = TextEditingController();
  final Controller3 = TextEditingController();

  @override
  void dispose(){
    Controller1.dispose();
    Controller2.dispose();
    Controller3.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text("Previous Years' Papers"),
        backgroundColor: Color(0xff3F80FA),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                  hintText: 'Course Code (Eg: CS222)'
              ),
              controller: Controller1,
            ),
            SizedBox(height: 30),
            TextField(
              decoration: InputDecoration(
                  hintText: 'Professor'
              ),
              controller: Controller2,

            ),
            SizedBox(height: 30),
            TextField(
              decoration: InputDecoration(
                  hintText: 'Year of Examination (Eg: 2015)'
              ),
              controller: Controller3,

            ),
            SizedBox(height: 30),
            DropdownButton<String>(
              isExpanded: true,
              value: dropdownValue,
              icon: Icon(Icons.arrow_drop_down),
              iconSize: 24,
              elevation: 16,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 17.0,
              ),

              onChanged: (String newValue) {
                setState(() {
                  dropdownValue = newValue;
                });
              },
              items: <String>[' Type of Paper                                                   ', 'Quiz 1', 'Midsem', 'Quiz 2', 'Endsem', 'Others']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              })
                  .toList(),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(16),
                  width: 150,
                  height: 40,

                  child: FlatButton(onPressed: () async {
                    file=await pick_file();
                    setState(() {
                      filename= basename(file.path);
                    });




                    }, child: Text('Browse',style: new TextStyle(fontSize: 20),), color: Colors.blue, textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),

                    ),
                  ),
                ),
                Text(filename),
              ],
            ),


            SizedBox(height: 15),
            Container(
              margin: EdgeInsets.all(16),
              width: 220,
              height: 50,

              child: FlatButton(onPressed: (){


                course=Controller1.text;
                year=Controller3.text;
                professor=Controller2.text;


                if(course=='')
                {
                  Fluttertoast.showToast(msg: 'Course code cannot be empty',backgroundColor: Colors.white70,textColor: Colors.black);
                }
                else if(course.substring(0,2).toLowerCase()!='cs' && course.substring(0,2).toLowerCase()!='bt'
                && course.substring(0,2).toLowerCase()!='ee'
                && course.substring(0,2).toLowerCase()!='hs'
                && course.substring(0,2).toLowerCase()!='ph'
                && course.substring(0,2).toLowerCase()!='ch'
                && course.substring(0,2).toLowerCase()!='me'
                && course.substring(0,2).toLowerCase()!='cl'
                    && course.substring(0,2).toLowerCase()!='ma'
                )
                  {
                    Fluttertoast.showToast(msg: 'Course code does not belong to valid department',backgroundColor: Colors.white70,textColor: Colors.black);
                  }
                else if(professor=='')
                  {
                    Fluttertoast.showToast(msg: "Please enter profeesor's name",backgroundColor: Colors.white70,textColor: Colors.black);
                  }
                else if(dropdownValue == ' Type of Paper                                                   ')
                {
                  Fluttertoast.showToast(msg: 'Please select a paper type',backgroundColor: Colors.white70 ,textColor: Colors.black);
                }
                else
                {
                 add_paper(context,file,course.toUpperCase(),dropdownValue,year,professor);

                  print('done');
                }




              }, child: Text('Upload',style: new TextStyle(fontSize: 20),), color: Colors.blue, textColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),

                ),
              ),
            ),

          ],
        ),
      ),

    );
  }

}