import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'question.dart';

class QuizBrain {
  int _score = 0;
  int _questioncounter = 0;

  List<Question> questionstore = [
    Question(question: 'are you a boy ?',answer: true),
    Question(question: 'are you gay ?',answer: true),
    Question(question: 'do you want to have a date ?',answer: true),
  ];

  List<Question> questionBank = [];

  List<Icon> scorekeeper = [];

  String name = '';

  Widget createText(String word, double size) {
    return Text(
      word,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: size,
        color: Colors.white,
      ),
    );
  }

  int getScore() {
    return _score;
  }

  int getQuestionNumber() {
    return _questioncounter;
  }

  void setQuestionNumber(int questionCounter) {
    this._questioncounter = questionCounter;
  }

  void increaseScore() {
    _score++;
  }

  void decreaseScore() {
    _score--;
  }

  void nextQuestion() {
    _questioncounter++;
  }
}