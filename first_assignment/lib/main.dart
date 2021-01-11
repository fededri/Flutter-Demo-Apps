// 1) Create a new Flutter App (in this project) and output an AppBar and some text
// below it
// 2) Add a button which changes the text (to any other text of your choice)
// 3) Split the app into three widgets: App, TextControl & Text

import 'package:first_assignment/customText.dart';
import 'package:first_assignment/textControl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _wasButtonPressed = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: CustomText("Assignment 1"),
        ),
        body: Column(
          children: [
            TextControl(_wasButtonPressed),
            RaisedButton(
              onPressed: onButtonPressed,
              textColor: Colors.blueAccent,
              child: CustomText("Press here"),
            )
          ],
        ),
      ),
    );
  }

  void onButtonPressed() {
    setState(() {
      _wasButtonPressed = true;
    });
  }
}
