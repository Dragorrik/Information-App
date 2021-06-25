import 'package:flutter/material.dart';
import 'package:flutter_app_2/question.dart';
import 'answer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final questions = const [
    {
      'questionText': 'whats your favourite colour?',
      'answers': ['black', 'red', 'green', 'white']
    },
    {
      'questionText': 'whats your favourite animal?',
      'answers': ['horse', 'tiger', 'goat', 'elephant']
    },
    {
      'questionText': 'whats your favourite game?',
      'answers': ['COC', 'COR', 'MLBB', 'Tyrant']
    }
  ];

  var _questionIndex = 0;
  void _answerQuestion() {
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    if (_questionIndex < questions.length) {
      print('We have more questons');
    } else {
      print('No more questions');
    }
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Only Testing"),
        ),
        body: _questionIndex < questions.length
            ? Column(
                children: [
                  Question(questions[_questionIndex]['questionText']),
                  // ignore: deprecated_member_use
                  ...(questions[_questionIndex]['answers'] as List<String>)
                      .map((answer) {
                    return Answer(_answerQuestion, answer);
                  }).toList()
                ],
              )
            : Center(
                child: Text('You have done it'),
              ),
      ),
    );
  }
}
