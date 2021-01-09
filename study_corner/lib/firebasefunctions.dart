import 'dart:async';
import 'dart:io';
import 'dart:core';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:file_picker/file_picker.dart';
import 'paper_def.dart';
import 'package:path/path.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';

void add_paper(BuildContext context, File file, String course, String type,
    String year, String professor) async {
  bool uploaded = await uploadfile(file, course, type, professor, year);
  if (uploaded)
    Fluttertoast.showToast(
        msg: 'Uploaded',
        backgroundColor: Colors.white70,
        textColor: Colors.black);
  else
    Fluttertoast.showToast(
        msg: 'Upload failed',
        backgroundColor: Colors.white70,
        textColor: Colors.black);
}

Future<File> pick_file() async {
  return await FilePicker.getFile(
      type: FileType.custom, allowedExtensions: ['pdf']);
}

Future<bool> uploadfile(File file, String course, String type, String professor,
    String year) async {
  if (file == null) return false;

  return await savePdf(
      file, basename(file.path), course, type, professor, year);
}

Future<bool> savePdf(File file, String name, String course, String type,
    String professor, String year) async {
  firebase_storage.Reference reference =
      firebase_storage.FirebaseStorage.instance.ref().child("Uploads/$name");
  firebase_storage.UploadTask uploadTask = reference.putFile(file);
  firebase_storage.TaskSnapshot downloadUrl =
      await uploadTask.catchError((error) {
    print(error);
    return null;
  });
  final String url = (await downloadUrl.ref.getDownloadURL());
  print("URL" + url);
  paper que = new paper(course, type, professor, url, year);
  String date = DateTime.now().day.toString() +
      '-' +
      DateTime.now().month.toString() +
      '-' +
      DateTime.now().year.toString();
  DatabaseReference ref = FirebaseDatabase.instance
      .reference()
      .child('Uploads/' + course + '_' + type + '/' + year);
  ref.push().set({
    'CourseCode': course,
    'Type': type,
    'FileUrl': url,
    'Prof': professor,
    'Year': year,
    'DateofUpload': date,
    'FileName': name,
    'downvoteCount': 0,
    'downvoters': {'0': 'Dummy mail'},
    'totalVotes': 0,
    'uploaderID': 'abc',
    'upvoteCount': 0,
    'upvoters': {'0': "Dummy Mail"}
  });
  print("url" + url);
  final _firestore = Firestore.instance;
  final _id = _firestore.collection('files').document().documentID;
  print('filesId:$_id');
  await Firestore.instance.collection('files').document(_id).setData(
    {
      'url': url,
      'name': name,
    },
  );
  if (downloadUrl != null) return true;
  return false;
}
