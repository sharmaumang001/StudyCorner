import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'paper_def.dart';
import 'package:firebase_database/firebase_database.dart';

class view_paper extends StatefulWidget{
  final List<paper> list;

  view_paper({Key key,@required this.list} ): super(key:key);
  @override
  view_paperState createState() => new view_paperState(list: list);
}
List<paper> list=new List();



class view_paperState extends State<view_paper>{
 List<paper> list;

  view_paperState({this.list});

  Widget build(BuildContext conetxt)
  {
    return new Scaffold(
      appBar: AppBar(
        title: Text("Question Paper"),
        backgroundColor: Color(0xff3F80FA),
      ),
      body:new ListView.builder(itemBuilder: (BuildContext context,int index)
      {
        return new Card(
          child: new Column(
            children: <Widget>[
              SizedBox(height: 10,),
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 children: <Widget>[
                   Text(list[index].CourseCode,style: TextStyle(fontSize: 18),),
                   Text(list[index].Type,style: TextStyle(fontSize: 18),),
                   Text(list[index].Year,style: TextStyle(fontSize: 18),),
                 ],
               ),
              SizedBox(height: 5,),
              Text('Prof:'+ list[index].Prof,style: TextStyle(fontSize: 15,color: Colors.grey),),

              Container(
                margin: EdgeInsets.all(16),
                width: 200,
                height: 30,

                child: FlatButton(onPressed: () {
                  }, child: Text('DOWNLOAD',style: new TextStyle(fontSize: 20),), color: Colors.amber, textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),

                  ),
                ),
              ),
            ],
          ),
        );
      },
      itemCount: list.length,),
    );
  }
}