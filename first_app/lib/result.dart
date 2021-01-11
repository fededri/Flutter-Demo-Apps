import 'package:flutter/cupertino.dart';

class Result extends StatelessWidget {
  final int _resultScore;

  Result(this._resultScore);

  String get resultPhrase {
    var resultText = "You did it!";
    if (_resultScore < 50) {
      resultText = "You are awesome and innocent!";
    } else {
      resultText = "You are not awesome";
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
      resultPhrase,
      style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
    ));
  }
}
