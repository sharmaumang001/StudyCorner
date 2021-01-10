import 'package:flutter/material.dart';

class ExamBox extends StatelessWidget {
  
  var colorp;

  ExamBox(this.colorp);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: colorp,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric( vertical : 4.0),
                      child: Text("Maths"),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric( vertical : 4.0),
                      child: Text("Comprehensive Exam"),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric( vertical : 4.0),
                      child: Text("Assigned by : The Study Corner"),
                    ),
                  ],
                ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                      padding: const EdgeInsets.symmetric( vertical : 8.0),
                    child: Text("No. of Questions : 40"),
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric( vertical : 8.0),
                    child: Text("Total Marks : 80"),
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric( vertical : 8.0),
                    child: Text("Time : 3 hrs"),
                  ),

                  RaisedButton(
                    onPressed: (){},
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    child: Text("Attempt Now"),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ExamScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Column(
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                RaisedButton(
                  color: Colors.cyan,
                  child: Container(
                    child: Center(child: Text("Assigned")),
                    width: MediaQuery.of(context).size.width * 0.3,
                  ),
                  onPressed: () {},
                ),
                RaisedButton(
                  child: Container(
                    child: Center(child: Text("Evaluated")),
                    width: MediaQuery.of(context).size.width * 0.3,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
            Expanded(
              child: ListView(
                children: [
                  ExamBox(Colors.cyan),
                                    ExamBox(Colors.cyan),
                  ExamBox(Colors.grey),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
