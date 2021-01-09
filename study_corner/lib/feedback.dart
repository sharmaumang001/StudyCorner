import 'dart:io';
import 'package:flutter/material.dart';
import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';

class FeedBack extends StatefulWidget {
  @override
  _FeedBackState createState() => _FeedBackState();
}

class _FeedBackState extends State<FeedBack> {
  bool _isLoading = true;
  PDFDocument document;

  @override
  void initState() {
    super.initState();
    loadDocument();
  }

  loadDocument() async {
    document = await PDFDocument.fromURL(
        'https://firebasestorage.googleapis.com/v0/b/studycorner-d7caa.appspot.com/o/Uploads%2Fpancard.pdf?alt=media&token=539d6293-1f4a-4364-b1ba-2db782157f04');

    setState(() => _isLoading = false);
  }

  changePDF(value) async {
    setState(() => _isLoading = true);
    if (value == 1) {
      document = await PDFDocument.fromURL(
          'https://firebasestorage.googleapis.com/v0/b/studycorner-d7caa.appspot.com/o/Uploads%2Fpancard.pdf?alt=media&token=539d6293-1f4a-4364-b1ba-2db782157f04');
    } else if (value == 2) {
      document = await PDFDocument.fromURL(
        "https://firebasestorage.googleapis.com/v0/b/studycorner-d7caa.appspot.com/o/Uploads%2Fpancard.pdf?alt=media&token=539d6293-1f4a-4364-b1ba-2db782157f04",
        /* cacheManager: CacheManager(
          Config(
            "customCacheKey",
            stalePeriod: const Duration(days: 2),
            maxNrOfCacheObjects: 10,
          ),
        ), */
      );
    } else {
      document = await PDFDocument.fromAsset(
          'https://firebasestorage.googleapis.com/v0/b/studycorner-d7caa.appspot.com/o/Uploads%2Fpancard.pdf?alt=media&token=539d6293-1f4a-4364-b1ba-2db782157f04');
    }
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: _isLoading
              ? Center(child: CircularProgressIndicator())
              : PDFViewer(
                  document: document,

                  //uncomment below code to replace bottom navigation with your own
                  navigationBuilder:
                      (context, page, totalPages, jumpToPage, animateToPage) {
                    return ButtonBar(
                      alignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.first_page),
                          onPressed: () {
                            jumpToPage(page: 0);
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.arrow_back),
                          onPressed: () {
                            animateToPage(page: page - 2);
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.arrow_forward),
                          onPressed: () {
                            animateToPage(page: page);
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.last_page),
                          onPressed: () {
                            jumpToPage(page: totalPages - 1);
                          },
                        ),
                      ],
                    );
                  },
                ),
        ),
      ),
    );
  }
}
