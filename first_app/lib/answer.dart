import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Answer extends StatelessWidget {

  String text;
  final Function selectHandler;

  Answer(this.text, this.selectHandler);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      child: RaisedButton(
          color: Colors.blue,
          child: Text("Answer 1"),
          onPressed: selectHandler,
      ),
    );
  }
}