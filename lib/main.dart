import 'package:flutter/material.dart';
import 'package:flutter_application_1/result.dart';

import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What\'s your fav color',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Blue', 'score': 1},
        {'text': 'Red', 'score': 7},
        {'text': 'Orange', 'score': 5},
      ],
    },
    {
      'questionText': 'What\'s your fav animal',
      'answers': [
        {'text': 'Rabbit', 'score': 10},
        {'text': 'Snake', 'score': 1},
        {'text': 'Elephant', 'score': 7},
        {'text': 'Lion', 'score': 5},
      ],
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerChosen(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {}
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My app'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerChosen: _answerChosen,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
