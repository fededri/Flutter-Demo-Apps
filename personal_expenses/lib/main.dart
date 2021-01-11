import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyHomePage());
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return scaffoldWidget(Column(
      mainAxisAlignment: MainAxisAlignment.start ,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Card(
          color: Colors.blueAccent,
          child: Container(
            child: Text("CHART!"),
            width: double.infinity,
          ),
          elevation: 5,
        ),
        Card(
          child: Text("list of transactions"),
        )
      ],
    ));
  }

  Widget scaffoldWidget(Widget body) {
    return Platform.isIOS
        ? CupertinoApp(
            home: CupertinoPageScaffold(
            navigationBar: CupertinoNavigationBar(
              middle: Text("Flutter App"),
            ),
            child: body,
          ))
        : MaterialApp(
            home: Scaffold(
            appBar: AppBar(
              title: Text("Flutter App"),
            ),
            body: body,
          ));
  }
}
