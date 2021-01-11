import 'package:first_app/Quiz.dart';
import 'package:first_app/result.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  var questionIndex = 0;
  var _totalScore = 0;

  final questions = [
    {
      "questionText": "What is your favorite color?",
      "answers": [
        {"text": "Black", "score": 10},
        {"text": "Black", "score": 20},
        {"text": "Black", "score": 30},
        {"text": "Black", "score": 40}
      ],
    },
    {
      "questionText": "What is your favorite animal?",
      "answers": [
        {"text": "Rabbit", "score": 10},
        {"text": "Cat", "score": 20},
        {"text": "Dog", "score": 30},
        {"text": "Bird", "score": 40}
      ],
    },
    {
      "questionText": "Who is your favorite instructor?",
      "answers": [
        {"text": "Black", "score": 10},
        {"text": "Black", "score": 20},
        {"text": "Black", "score": 30},
        {"text": "Black", "score": 40}
      ],
    }
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("My first App"),
        ),
        body: questionIndex < questions.length
            ? Quiz(
                questions: questions,
                answerQuestion: answerQuestion,
                questionIndex: questionIndex)
            : Result(_totalScore),
      ),
    );
  }

  void answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      questionIndex = questionIndex + 1;
    });
    print("Answer selected!");
  }
}
