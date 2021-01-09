import 'package:firebase_database/firebase_database.dart';

class paper{
  String CourseCode;
  String Type;
  String Prof;
  String FileUrl;
  String Year;

  paper(
      this.CourseCode,
      this.Type,
      this.Prof,
      this.FileUrl,
      this.Year,
      );

  paper.fromSnapshot(var value):
      CourseCode=value['CourseCode'],
      Type=value['Type'],
      Prof=value['Prof'],
      FileUrl=value['FileUrl'],
      Year=value['Year'];





}
