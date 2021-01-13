import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

// void main() {
//   runApp(MyApp());
// }

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;

  void _answerQuestion() {
    setState(() {
      _questionIndex += 1;
    });
  }

  static const questions = [
    {
      'questionText': 'What\'s your favorite color ?',
      'answerText': ['Red', 'Blue', 'Green', 'Yellow']
    },
    {
      'questionText': 'What\'s your favorite sport ?',
      'answerText': ['Skiing', 'Baddy', 'Cricket']
    },
    {
      'questionText': 'What\'s your favorite food ?',
      'answerText': ['Cheese', 'Burger', 'Ham', 'Pasta']
    },
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text("Quiz App"),
      ),
      body: _questionIndex < questions.length
          ? Column(
              children: [
                Question(
                  "Question: " + questions[_questionIndex]['questionText'],
                ),
                ...(questions[_questionIndex]['answerText'] as List<String>)
                    .map((answer) {
                  return Answer(_answerQuestion, answer);
                }).toList(),
              ],
            )
          : Center(
              child: Text("End of quiz!"),
            ),
    ));
  }
}
